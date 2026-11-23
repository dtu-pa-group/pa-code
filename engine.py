"""Compose independent analyzers; JPAMB owns benchmark iteration and scoring.

From Python: run(["static_sign", "dynamic_small"], method_id).
From JPAMB: jpamb analyse -- python engine.py --analyses static_sign,dynamic_small
"""

import argparse
from collections.abc import Callable, Mapping, Sequence
from contextlib import redirect_stdout
from dataclasses import dataclass, field
from functools import partial
from pathlib import Path
import random
import sys

# These projects use flat modules. Resolve them relative to this checkout, never
# relative to the caller's working directory. Technique implementations stay intact.
ROOT = Path(__file__).resolve().parent
for directory in (
    ROOT / "src",
    ROOT / "solutions/static/src",
    ROOT / "solutions/dynamic/src",
):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

QUERIES = (
    "*",
    "assertion error",
    "divide by zero",
    "null pointer",
    "ok",
    "out of bounds",
)


@dataclass(frozen=True)
class Evidence:
    """A technique's predictions and query-specific complete-execution guarantees.

    Dynamic `no` is trusted only for queries in complete. Bounded sampling,
    unsupported execution, and interpreter timeouts do not establish completeness.
    """

    predictions: Mapping[str, str] = field(default_factory=dict)
    complete: frozenset[str] = frozenset()


@dataclass(frozen=True)
class Technique:
    kind: str
    analyze: Callable


REGISTRY: dict[str, Technique] = {}


def register(name: str, kind: str, analyze: Callable) -> None:
    """Register an adapter (bytecode, method_id) -> Evidence, e.g. dynamic_coverage."""
    if kind not in {"static", "dynamic"}:
        raise ValueError("kind must be static or dynamic")
    if name in REGISTRY:
        raise ValueError(f"Technique already registered: {name}")
    if not callable(analyze):
        raise TypeError("analyze must be callable")
    REGISTRY[name] = Technique(kind, analyze)


def combine(static: Sequence[Evidence], dynamic: Sequence[Evidence]) -> dict[str, str]:
    """Intersect static possibility sets and union dynamic witnesses.

    Missing entries mean unknown, not absence. Even static yes is only a
    possibility here; only concrete dynamic witnesses establish existence.
    """
    result = {}
    for query in QUERIES:
        excluded = any(e.predictions.get(query) == "no" for e in static)
        witnessed = any(e.predictions.get(query) in {"yes", "found"} for e in dynamic)
        complete_no = any(
            e.predictions.get(query) == "no" and query in e.complete for e in dynamic
        )
        if witnessed:
            result[query] = "yes"
            if excluded:
                print(
                    f"Disagreement for {query}: dynamic witness contradicts static exclusion",
                    file=sys.stderr,
                )
        elif excluded or complete_no:
            result[query] = "no"
        else:
            result[query] = "maybe"
    return result


def _static(domain, bc, method_id):
    from configuration import parse_options
    from static import AbstractInterpreter

    config, _ = parse_options(["--abstractions", domain])
    finals = set()
    incomplete = True
    try:
        interpreter = AbstractInterpreter.initial(bc, method_id, None, config)
        for _ in range(300):
            if not interpreter.worklist:
                break
            _, outcomes = interpreter.step()
            finals.update(outcomes)
        incomplete = bool(interpreter.worklist)
    except NotImplementedError as error:
        print(f"static_{domain}: {error}", file=sys.stderr)
    return Evidence(
        {
            query: "maybe" if query in finals or incomplete or query == "*" else "no"
            for query in QUERIES
        }
    )


def _dynamic(strategy, bc, method_id):
    import dynamic

    rand = random.Random(0)
    behaviors = set()
    generators = {
        "random": lambda: dynamic.random_inputs(rand, method_id),
        "small": lambda: dynamic.fuzz_small(rand, method_id),
        "mutation": lambda: dynamic.fuzz_mutation(rand, method_id, behaviors),
    }
    unsupported = set()
    try:
        for inputs in generators[strategy]():
            try:
                behaviors.add(dynamic.execute_input(bc, method_id, inputs, 200))
            except NotImplementedError as error:
                if str(error) not in unsupported:
                    print(
                        f"dynamic_{strategy}: Unsupported execution: {error}",
                        file=sys.stderr,
                    )
                    unsupported.add(str(error))
    except NotImplementedError as error:
        print(f"dynamic_{strategy}: {error}", file=sys.stderr)
    # None of the current fuzzers certifies exhaustive, complete execution.
    return Evidence(
        {
            query: ("timeout" if query == "*" else "found")
            if query in behaviors
            else "not-found"
            for query in QUERIES
        }
    )


for _name, _domain in (
    ("static_sign", "sign"),
    ("static_string", "string"),
    ("static_int", "interval"),
):
    register(_name, "static", partial(_static, _domain))
for _strategy in ("random", "small", "mutation"):
    register(f"dynamic_{_strategy}", "dynamic", partial(_dynamic, _strategy))


def _selection(analyses):
    if isinstance(analyses, str):
        raise TypeError("analyses must be a sequence of technique names, not a string")
    names = tuple(
        dict.fromkeys(
            "static_int" if name == "static_interval" else name for name in analyses
        )
    )
    unknown = set(names) - REGISTRY.keys()
    if unknown:
        raise ValueError(
            f"Unknown/unimplemented analyses: {', '.join(sorted(unknown))}. Available: {', '.join(REGISTRY)}"
        )
    return names


def run(analyses, method_id=None, *, bytecode=None) -> dict[str, str]:
    """Analyze one method and return all JPAMB query predictions without printing.

    Pass a method string or parsed AbsMethodID. If omitted, use JPAMB's sole
    positional method/info argument (useful for Jev's analyzer entry point).
    An optional Bytecode lets callers reuse a suite and its parsed method cache.
    Empty selections conservatively return maybe for every query.
    """
    names = _selection(analyses)
    if method_id is None:
        import jpamb

        method_id = jpamb.getmethodid(
            "engine", "1.0", "Los Pollos Hermanos", [*names, "python"], for_science=True
        )
    if isinstance(method_id, str) or bytecode is None:
        import jpamb

        if isinstance(method_id, str):
            method_id = jpamb.parse_methodid(method_id)
        if bytecode is None:
            suite, eff = jpamb.setup()
            bytecode = jpamb.Bytecode(suite, eff, {})
    evidence = {"static": [], "dynamic": []}
    # Canonical ordering makes input order irrelevant; static runs first.
    for kind in ("static", "dynamic"):
        for name in sorted(names):
            technique = REGISTRY[name]
            if technique.kind == kind:
                with redirect_stdout(sys.stderr):
                    evidence[kind].append(technique.analyze(bytecode, method_id))
    return combine(evidence["static"], evidence["dynamic"])


def emit(predictions):
    """Emit exactly one protocol line per query, in JPAMB query order."""
    for query in QUERIES:
        print(f"{query};{predictions[query]}")


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument(
        "--analyses", required=True, help="comma-separated technique names"
    )
    parser.add_argument("method", help="JPAMB method identifier or info")
    args = parser.parse_args(argv)
    try:
        names = _selection([name.strip() for name in args.analyses.split(",")])
    except (ValueError, TypeError) as error:
        parser.error(str(error))
    if args.method == "info":
        import jpamb

        jpamb.printinfo(
            "engine", "1.0", "Los Pollos Hermanos", [*names, "python"], True
        )
    emit(run(names, args.method))


if __name__ == "__main__":
    main()
