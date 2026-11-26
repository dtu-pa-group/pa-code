"""Compare analyzer selection strategies on the full JPAMB suite.

Reuse each strategy's selections across three analysis passes and export the
timings, predictions, and scores. The Jev strategy reads saved pre-computed
selections and selection times from files.
"""

import argparse
import csv
import io
import json
import math
import os
import sys
from datetime import UTC, datetime
from pathlib import Path
from statistics import mean
from tempfile import mkdtemp
from time import perf_counter

import engine
import jpamb
from jpamb import analyse
from jpamb.case import Experiment
from jpamb.report import write_report
from jpamb.utils import Effect, dump_table
from solutions.heuristics.rule_based import select_for_method

ROOT = Path(__file__).resolve().parent
JEV_SELECTIONS = ROOT / "solutions/jeving/output/analysis_selections.json"
STRATEGIES = ("jev", "heuristic", "run-all")
ITERATIONS = 3


def unique_json_object(pairs):
    """Build a JSON object and reject duplicate keys.

    Args:
        pairs: Key-value pairs from the JSON decoder, in input order.

    Returns:
        A dictionary containing the decoded object.

    Raises:
        ValueError: Two pairs have the same key.
    """
    result = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"Duplicate JSON key: {key}")
        result[key] = value
    return result


def read_json(path):
    """Read a UTF-8 JSON file.

    Args:
        path: Path to the JSON file.

    Returns:
        The decoded JSON value.

    Raises:
        OSError: The file cannot be read.
        ValueError: The file contains invalid JSON or duplicate object keys.
    """
    try:
        return json.loads(
            path.read_text(encoding="utf-8"), object_pairs_hook=unique_json_object
        )
    except ValueError as error:
        raise ValueError(f"{path}: {error}") from error


def match_methods(values, method_ids, path):
    """Match input entries to the benchmark's full JVM method IDs.

    Args:
        values: Pairs of method identifiers and their associated values. An
            identifier can omit its descriptor if the name is unambiguous.
        method_ids: Set of full JVM method IDs that the input must cover.
        path: Input file path to include in validation errors.

    Returns:
        A dictionary mapping each full JVM method ID to its input value.

    Raises:
        ValueError: An entry is unknown, ambiguous, or duplicated, or a required
            method is missing.
    """
    aliases = {}
    for method_id in method_ids:
        aliases.setdefault(method_id.split(":", 1)[0], []).append(method_id)

    matched = {}
    for key, value in values:
        if key in method_ids:
            method_id = key
        else:
            candidates = aliases.get(key, ())
            if not candidates:
                raise ValueError(f"{path}: unknown benchmark method {key!r}")
            if len(candidates) != 1:
                raise ValueError(f"{path}: use a full JVM method ID for {key!r}")
            method_id = candidates[0]
        if method_id in matched:
            raise ValueError(f"{path}: duplicate entry for {method_id}")
        matched[method_id] = value

    missing = sorted(method_ids - matched.keys())
    if missing:
        raise ValueError(
            f"{path}: missing {len(missing)} methods, starting with {missing[0]}"
        )
    return matched


def load_jev(selections_path, times_path, method_ids):
    """Load the saved Jev choices and selection times for the benchmark.

    Args:
        selections_path: Path to the JSON array of method and analyzer records.
        times_path: Path to the JSON object mapping method identifiers to
            selection times in seconds.
        method_ids: Set of full JVM method IDs that both files must cover.

    Returns:
        A dictionary keyed by full JVM method ID. Each value contains the
        normalized analyzer list and the recorded selection time in seconds.

    Raises:
        OSError: An input file cannot be read.
        TypeError: The JSON values have the wrong structure.
        ValueError: An input contains invalid analyzers or timings, or its
            method identifiers do not match the benchmark.
    """
    records = read_json(selections_path)
    if not isinstance(records, list):
        raise TypeError(f"{selections_path}: expected a JSON array of selections")

    selections = []
    for record in records:
        if not isinstance(record, dict) or not isinstance(record.get("method_id"), str):
            raise TypeError(f"{selections_path}: each selection needs a method_id")
        selected = record.get("selected_analyzers")
        if not isinstance(selected, list) or not all(
            isinstance(name, str) for name in selected
        ):
            raise ValueError(
                f"{selections_path}: invalid analyzers for {record['method_id']}"
            )
        selections.append((record["method_id"], engine._selection(selected)))
    selected_by_method = match_methods(selections, method_ids, selections_path)

    times = read_json(times_path)
    if not isinstance(times, dict):
        raise TypeError(
            f"{times_path}: expected a JSON object mapping method IDs to seconds"
        )
    for method_id, seconds in times.items():
        if (
            type(seconds) not in (int, float)
            or not math.isfinite(seconds)
            or seconds < 0
        ):
            raise ValueError(
                f"{times_path}: expected finite nonnegative seconds for {method_id}"
            )
    times_by_method = match_methods(times.items(), method_ids, times_path)

    return {
        method_id: {
            "selected_analyzers": selected_by_method[method_id],
            "selection_seconds": times_by_method[method_id],
        }
        for method_id in sorted(method_ids)
    }


def local_selections(strategy, method_ids):
    """Prepare and time selections for a local strategy.

    Args:
        strategy: Either `heuristic` or `run-all`.
        method_ids: Iterable of full JVM method IDs to prepare.

    Returns:
        A dictionary keyed by method ID. Each value contains the selected
        analyzers and the selection time in seconds. Run-all uses zero as its
        selection time because its analyzer list is fixed.
    """
    selections = {}
    for method_id in method_ids:
        if strategy == "heuristic":
            start = perf_counter()
            selected = select_for_method(method_id, ROOT)
            seconds = perf_counter() - start
        else:
            selected = engine.REGISTRY
            seconds = 0.0
        selections[method_id] = {
            "selected_analyzers": engine._selection(selected),
            "selection_seconds": seconds,
        }
    return selections


def analyze_method(strategy, selections_path, timings_path, method_id):
    """Time one analysis and send its predictions to JPAMB.

    Args:
        strategy: Strategy name used in JPAMB's metadata.
        selections_path: Path to the JSON file with precomputed selections.
        timings_path: Path to the JSONL file that receives the timing record.
        method_id: Full JVM method ID or `info` to print analyzer metadata
            and exit.
    """
    if method_id == "info":
        jpamb.printinfo(
            f"evaluation-{strategy}", "1.0", "Los Pollos Hermanos", ["python"], True
        )

    selected = read_json(selections_path)[method_id]["selected_analyzers"]
    start = perf_counter()
    predictions = engine.run(selected, method_id)
    elapsed = perf_counter() - start

    with timings_path.open("a", encoding="utf-8") as output:
        output.write(
            json.dumps({"method_id": method_id, "analysis_seconds": elapsed}) + "\n"
        )
    engine.emit(predictions)


def run_strategy(strategy, selections, methods, benchmark, output_dir, timeout):
    """Run three JPAMB analysis passes for one strategy and save its report.

    Args:
        strategy: Name of the strategy under test.
        selections: Mapping from full JVM method IDs to analyzer lists and
            selection times in seconds.
        methods: Ordered list of JPAMB benchmark methods.
        benchmark: JPAMB benchmark providing the expected outcomes and scoring
            inputs.
        output_dir: Existing directory for selections, timings, and the native
            JPAMB report.
        timeout: Maximum time in seconds for each JPAMB analyzer invocation.

    Returns:
        A tuple containing the per-method result rows and the strategy totals.
        The totals charge selection time once and use the mean analysis time
        across the three passes.

    Raises:
        RuntimeError: A JPAMB pass fails, the report is invalid or empty, or
            the timing records are incomplete.
    """
    selections_path = output_dir / f"{strategy}-selections.json"
    selections_path.write_text(
        json.dumps(selections, indent=2) + "\n", encoding="utf-8"
    )
    timings_path = output_dir / f"{strategy}-analysis-times.jsonl"
    log = io.StringIO()
    effect = Effect(log)
    command = (
        sys.executable,
        str(Path(__file__).resolve()),
        "_analyze",
        strategy,
        str(selections_path),
        str(timings_path),
    )
    config = analyse.Config.from_cmd(
        command, methods, timeout=timeout, iterations=ITERATIONS, eff=effect
    )
    state = analyse.State(config)
    for iteration in range(1, ITERATIONS + 1):
        print(f"{strategy}: analysis pass {iteration}/{ITERATIONS}", file=sys.stderr)
        for method in methods:
            if not state.run_next(benchmark=benchmark, eff=effect):
                raise RuntimeError(
                    f"{strategy}: JPAMB failed on pass {iteration}, method {method}\n"
                    f"{log.getvalue()[-2400:]}"
                )

    summary = state.summary()
    scores = summary.score_results(benchmark=benchmark, eff=effect)
    if scores.invalid:
        raise RuntimeError(f"{strategy}: {scores.invalid}")
    # Save the native report even though the terminal uses our combined table.
    report_path = output_dir / f"{strategy}.sexp"
    with report_path.open("w", encoding="utf-8") as output:
        write_report(summary, file=output, eff=effect)
    if report_path.stat().st_size == 0:
        raise RuntimeError(f"JPAMB could not write {report_path}")

    method_scores = {
        f"{classname}.{row.methodname}": row.score
        for classname, group in scores.results
        for row in group
    }
    by_method = {method.encode(): [] for method in methods}
    for line in timings_path.read_text(encoding="utf-8").splitlines():
        record = json.loads(line)
        by_method[record["method_id"]].append(record["analysis_seconds"])
    rows = []
    for method in methods:
        method_id = method.encode()
        results = summary.results[method]
        timings = by_method[method_id]
        if len(timings) != ITERATIONS or len(results) != ITERATIONS:
            raise RuntimeError(f"{strategy}: incomplete measurements for {method_id}")
        selection = selections[method_id]
        mean_seconds = mean(timings)
        rows.append(
            {
                "strategy": strategy,
                "method_id": method_id,
                **selection,
                "analysis_runs": [
                    {
                        "iteration": iteration,
                        "analysis_seconds": elapsed,
                        "predictions": {
                            query: result.response.predictions[query].name
                            for query in engine.QUERIES
                        },
                    }
                    for iteration, (elapsed, result) in enumerate(
                        zip(timings, results), 1
                    )
                ],
                "mean_analysis_seconds": mean_seconds,
                "selection_plus_analysis_seconds": selection["selection_seconds"]
                + mean_seconds,
                "expected_outcomes": sorted(
                    benchmark.experiments[Experiment(method, None)].results
                ),
                "jpamb_score": method_scores[method_id],
            }
        )

    totals = {
        "strategy": strategy,
        "methods": len(rows),
        "selection_seconds": sum(row["selection_seconds"] for row in rows),
        "mean_analysis_seconds": sum(row["mean_analysis_seconds"] for row in rows),
        "selection_plus_analysis_seconds": sum(
            row["selection_plus_analysis_seconds"] for row in rows
        ),
        "jpamb_score": scores.total_score,
    }
    return rows, totals


def export_tables(output_dir, rows, totals):
    """Write the combined JSON results and the per-method CSV.

    Args:
        output_dir: Existing directory for the exported files.
        rows: Nonempty list of per-method result records.
        totals: List of strategy summary records.
    """
    (output_dir / "results.json").write_text(
        json.dumps({"methods": rows, "strategies": totals}, indent=2) + "\n",
        encoding="utf-8",
    )
    csv_rows = []
    for row in rows:
        csv_row = dict(row)
        for key in ("selected_analyzers", "expected_outcomes"):
            csv_row[key] = json.dumps(csv_row[key])
        for run in csv_row.pop("analysis_runs"):
            iteration = run["iteration"]
            csv_row[f"analysis_seconds_{iteration}"] = run["analysis_seconds"]
            csv_row[f"predictions_{iteration}"] = json.dumps(run["predictions"])
        csv_rows.append(csv_row)
    with (output_dir / "methods.csv").open("w", encoding="utf-8", newline="") as output:
        writer = csv.DictWriter(output, fieldnames=csv_rows[0])
        writer.writeheader()
        writer.writerows(csv_rows)


def print_tables(rows, totals):
    """Print per-method results and strategy totals to standard output.

    Args:
        rows: List of per-method result records, including predictions by pass.
        totals: List of strategy summary records.
    """
    print("Predictions by pass (Y = yes, N = no, M = maybe)")
    print("Query order: " + ", ".join(engine.QUERIES))
    details = [
        [
            "Strategy",
            "Java method",
            "Selected analyzers",
            "Select (s)",
            "Analysis passes (s)",
            "Mean (s)",
            "Predictions",
            "Expected outcomes",
            "Score",
        ]
    ]
    for row in rows:
        runs = row["analysis_runs"]
        predictions = [
            "".join(run["predictions"][query][0].upper() for query in engine.QUERIES)
            for run in runs
        ]
        details.append(
            [
                row["strategy"],
                row["method_id"],
                ", ".join(row["selected_analyzers"]),
                f"{row['selection_seconds']:.6f}",
                " / ".join(f"{run['analysis_seconds']:.6f}" for run in runs),
                f"{row['mean_analysis_seconds']:.6f}",
                " / ".join(predictions),
                ", ".join(row["expected_outcomes"]),
                f"{row['jpamb_score']:.4f}",
            ]
        )
    dump_table(details, align="<<<>>><<>", file=sys.stdout)
    print()
    overview = [
        [
            "Strategy",
            "Methods",
            "Select (s)",
            "Mean analysis (s)",
            "Select + mean analysis (s)",
            "JPAMB score",
        ]
    ]
    for row in totals:
        overview.append(
            [
                row["strategy"],
                str(row["methods"]),
                f"{row['selection_seconds']:.6f}",
                f"{row['mean_analysis_seconds']:.6f}",
                f"{row['selection_plus_analysis_seconds']:.6f}",
                f"{row['jpamb_score']:.4f}",
            ]
        )
    dump_table(overview, align="<>>>>>", file=sys.stdout)


def main(argv=None):
    """Run the requested strategies and export experiment results.

    Args:
        argv: Optional list of command-line arguments. If omitted, argparse
            reads the arguments from the current process.

    Raises:
        SystemExit: Argument parsing requests an exit or the experiment fails.
    """
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=lambda prog: argparse.HelpFormatter(prog, width=100),
        epilog=(
            "Examples: --strategies heuristic run-all | --strategies all --jev-times times.json. "
            "Jev timings and selections must come from the same run."
        ),
    )
    parser.add_argument(
        "--strategies",
        nargs="+",
        choices=(*STRATEGIES, "all"),
        metavar="STRATEGY",
        required=True,
        help=f"one or more of {', '.join(STRATEGIES)}, or 'all' for all three",
    )
    parser.add_argument(
        "--jev-times",
        type=Path,
        help="required for Jev: JSON object mapping each benchmark method ID to seconds",
    )
    parser.add_argument(
        "--jev-selections",
        type=Path,
        default=JEV_SELECTIONS,
        help="Jev selection JSON array (default: the repository's saved selections)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        help="new output directory (default: reports/experiment-YYYY-MM-DDTHH-MM-SSZ-<unique-code>)",
    )
    parser.add_argument(
        "--timeout",
        type=float,
        default=5.0,
        help="JPAMB timeout per analysis in seconds (default: 5)",
    )
    args = parser.parse_args(argv)
    strategies = tuple(dict.fromkeys(args.strategies))
    if "all" in strategies:
        if len(strategies) != 1:
            parser.error("'all' must be used by itself")
        strategies = STRATEGIES
    if "jev" in strategies and args.jev_times is None:
        parser.error("--jev-times is required when running Jev")
    if not math.isfinite(args.timeout) or args.timeout <= 0:
        parser.error("--timeout must be positive and finite")

    output_dir = args.output_dir.resolve() if args.output_dir else None

    try:
        suite = jpamb.Suite.from_workdir(ROOT)
        benchmark = suite.benchmark(eff=Effect(None))
        methods = sorted(
            {exp.entry for exp in benchmark.experiments if exp.input is None}, key=str
        )
        if not methods:
            raise ValueError("the JPAMB benchmark contains no methods")
        method_ids = [method.encode() for method in methods]
        jev_selections = None
        if "jev" in strategies:
            jev_selections = load_jev(
                args.jev_selections, args.jev_times, set(method_ids)
            )
        if output_dir is None:
            reports_dir = ROOT / "reports"
            reports_dir.mkdir(exist_ok=True)
            timestamp = datetime.now(UTC).strftime("%Y-%m-%dT%H-%M-%SZ")
            output_dir = Path(
                mkdtemp(prefix=f"experiment-{timestamp}-", dir=reports_dir)
            )
        else:
            output_dir.mkdir(parents=True)

        os.chdir(ROOT)
        rows, totals = [], []
        print(f"Saving evaluation artifacts in {output_dir}", file=sys.stderr)
        for strategy in strategies:
            selections = (
                jev_selections
                if strategy == "jev"
                else local_selections(strategy, method_ids)
            )
            strategy_rows, strategy_totals = run_strategy(
                strategy, selections, methods, benchmark, output_dir, args.timeout
            )
            rows.extend(strategy_rows)
            totals.append(strategy_totals)
        export_tables(output_dir, rows, totals)
        print_tables(rows, totals)
        print(f"Artifacts: {output_dir}")
    except (OSError, RuntimeError, TypeError, ValueError) as error:
        parser.exit(1, f"experiment: {error}\n")


if __name__ == "__main__":
    if len(sys.argv) == 6 and sys.argv[1] == "_analyze":
        _, _, strategy, selections_file, timings_file, method = sys.argv
        analyze_method(strategy, Path(selections_file), Path(timings_file), method)
    else:
        main()
