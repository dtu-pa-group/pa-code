"""Engine contracts; pure tests run with stdlib unittest as well as pytest."""

from contextlib import redirect_stderr, redirect_stdout
import io
from itertools import product
from pathlib import Path
import sys
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import engine


class CombinationTests(unittest.TestCase):
    def test_combination_table(self):
        for static, dynamic, complete in product(
            ("yes", "no", "maybe", "unknown", None),
            ("yes", "found", "no", "not-found", "timeout", "maybe", None),
            (False, True),
        ):
            with self.subTest(static=static, dynamic=dynamic, complete=complete):
                err = io.StringIO()
                with redirect_stderr(err):
                    result = engine.combine(
                        [engine.Evidence({"ok": static})],
                        [
                            engine.Evidence(
                                {"ok": dynamic},
                                frozenset({"ok"}) if complete else frozenset(),
                            )
                        ],
                    )
                expected = (
                    "yes"
                    if dynamic in {"yes", "found"}
                    else (
                        "no"
                        if static == "no" or dynamic == "no" and complete
                        else "maybe"
                    )
                )
                self.assertEqual(result["ok"], expected)
                self.assertEqual(
                    bool(err.getvalue()), static == "no" and expected == "yes"
                )

    def test_intersection_union_and_query_specific_completeness(self):
        result = engine.combine(
            [engine.Evidence({"ok": "maybe"}), engine.Evidence({"ok": "no"})],
            [
                engine.Evidence(
                    {"null pointer": "no", "*": "no"}, frozenset({"null pointer"})
                ),
                engine.Evidence({"out of bounds": "found"}),
            ],
        )
        self.assertEqual(
            result,
            dict(zip(engine.QUERIES, ("maybe", "maybe", "maybe", "no", "no", "yes"))),
        )

    def test_timeout_does_not_prove_nontermination(self):
        self.assertEqual(
            engine.combine([], [engine.Evidence({"*": "timeout"})])["*"], "maybe"
        )


class OrchestrationTests(unittest.TestCase):
    def test_all_subsets_and_order(self):
        names = tuple(engine.REGISTRY)
        for flags in product((False, True), repeat=len(names)):
            selected = [name for name, enabled in zip(names, flags) if enabled]
            calls = []

            def adapter(name, bc, method):
                calls.append(name)
                print("adapter diagnostic")
                return engine.Evidence(
                    {"ok": "found" if name.startswith("dynamic") else "maybe"}
                )

            registry = {
                name: engine.Technique(
                    t.kind, lambda bc, method, name=name: adapter(name, bc, method)
                )
                for name, t in engine.REGISTRY.items()
            }
            out, err = io.StringIO(), io.StringIO()
            with (
                patch.dict(engine.REGISTRY, registry, clear=True),
                redirect_stdout(out),
                redirect_stderr(err),
            ):
                result = engine.run(
                    list(reversed(selected)) + selected, object(), bytecode=object()
                )
            self.assertEqual(
                calls,
                sorted(n for n in selected if n.startswith("static"))
                + sorted(n for n in selected if n.startswith("dynamic")),
            )
            self.assertEqual(
                result["ok"],
                "yes" if any(n.startswith("dynamic") for n in selected) else "maybe",
            )
            self.assertEqual(out.getvalue(), "")

    def test_alias_validation_and_extension(self):
        self.assertEqual(
            engine._selection(["static_interval", "static_int"]), ("static_int",)
        )
        with self.assertRaises(ValueError):
            engine.run(["dynamic_coverage"], object(), bytecode=object())
        with self.assertRaises(TypeError):
            engine.run("static_sign")
        with patch.dict(engine.REGISTRY):
            engine.register(
                "dynamic_coverage",
                "dynamic",
                lambda bc, mid: engine.Evidence({"ok": "found"}),
            )
            self.assertEqual(
                engine.run(["dynamic_coverage"], object(), bytecode=object())["ok"],
                "yes",
            )

    def test_emit_protocol(self):
        out = io.StringIO()
        with redirect_stdout(out):
            engine.emit(engine.combine([], []))
        self.assertEqual(
            out.getvalue().splitlines(), [f"{q};maybe" for q in engine.QUERIES]
        )

    def test_static_budget_and_unsupported_cannot_exclude(self):
        for steps, failure in (
            (300, None),
            (1, NotImplementedError("opcode")),
            (0, None),
        ):
            ai = SimpleNamespace(
                worklist=[1] if steps else [],
                step=Mock(return_value=(None, {"ok"}), side_effect=failure),
            )
            module = SimpleNamespace(
                AbstractInterpreter=SimpleNamespace(initial=Mock(return_value=ai))
            )
            with (
                patch.dict(
                    sys.modules,
                    {
                        "static": module,
                        "configuration": SimpleNamespace(
                            parse_options=lambda args: (object(), [])
                        ),
                    },
                ),
                redirect_stderr(io.StringIO()),
            ):
                evidence = engine._static("sign", object(), object())
            self.assertEqual(
                evidence.predictions["null pointer"], "maybe" if steps else "no"
            )
            self.assertEqual(evidence.predictions["*"], "maybe")

    def test_dynamic_keeps_witness_after_unsupported_and_timeout(self):
        fake = SimpleNamespace(
            random_inputs=lambda rand, mid: iter([1, 2, 3]),
            execute_input=Mock(side_effect=["ok", NotImplementedError("opcode"), "*"]),
        )
        with patch.dict(sys.modules, {"dynamic": fake}), redirect_stderr(io.StringIO()):
            evidence = engine._dynamic("random", object(), object())
        self.assertEqual(evidence.predictions["ok"], "found")
        self.assertEqual(evidence.predictions["*"], "timeout")
        self.assertFalse(evidence.complete)


if __name__ == "__main__":
    unittest.main()
