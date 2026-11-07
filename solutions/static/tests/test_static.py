from collections import deque
from pathlib import Path
from types import SimpleNamespace

import pytest

import jpamb
import static
from abstractions import SignSet


@pytest.fixture
def run_analysis(monkeypatch, capsys):
    monkeypatch.chdir(Path(__file__).resolve().parents[3])

    def run(signature):
        monkeypatch.setattr("sys.argv", ["static-analysis", signature])
        static.analyse()
        output = capsys.readouterr().out
        return dict(line.split(";", 1) for line in output.splitlines())

    return run


@pytest.mark.parametrize(
    "method, expected",
    [
        ("divideByN:(I)I", {"divide by zero": "maybe", "ok": "maybe"}),
        ("divideByZero:()I", {"divide by zero": "maybe", "ok": "no"}),
        ("doNothing:()V", {"ok": "maybe", "divide by zero": "no"}),
    ],
)
def test_integer_methods(run_analysis, method, expected):
    predictions = run_analysis("jpamb.cases.Simple." + method)
    for outcome, prediction in expected.items():
        assert predictions[outcome] == prediction
    assert predictions["*"] == "unknown"


@pytest.mark.parametrize(
    "method",
    [
        "jpamb.cases.Arrays.arrayNotEmpty:([I)V",
        "jpamb.cases.Arrays.arrayContent:()V",
    ],
)
def test_unsupported_analysis_is_unknown(run_analysis, method):
    assert set(run_analysis(method).values()) == {"unknown"}


def test_budget_exhaustion_is_unknown(run_analysis, monkeypatch):
    unfinished = SimpleNamespace(worklist=deque([0]), step=lambda: (0, set()))
    monkeypatch.setattr(
        static.AbstractInterpreter, "initial", lambda *args: unfinished
    )
    predictions = run_analysis("jpamb.cases.Simple.doNothing:()V")
    assert set(predictions.values()) == {"unknown"}


def test_boolean_initialization(monkeypatch):
    monkeypatch.chdir(Path(__file__).resolve().parents[3])
    suite, effect = jpamb.setup()
    bytecode = jpamb.Bytecode(suite, effect, {})
    method = jpamb.parse_methodid("jpamb.cases.Simple.assertBoolean:(Z)V")
    states = static.initialstate(bytecode, method, None)
    state = next(iter(states.values()))
    assert state.locals[0] == SignSet.from_sign("0+")
