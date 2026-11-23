"""Run with the project's dependencies and built target/ benchmark."""

import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import engine
import jpamb
from jpamb.analyse import Category, Response, Tracker

METHOD = "jpamb.cases.Simple.divideByN:(I)I"


@pytest.fixture
def bytecode():
    suite = jpamb.Suite(engine.ROOT)
    if not suite.decompiled_folder.exists():
        pytest.skip("build/decompile the benchmark first")
    return jpamb.Bytecode(suite, jpamb.utils.Effect(None), {})


@pytest.mark.parametrize("name", tuple(engine.REGISTRY))
def test_real_technique(name, bytecode, capsys):
    result = engine.run([name], METHOD, bytecode=bytecode)
    assert tuple(result) == jpamb.QUERIES
    assert set(result.values()) <= {"yes", "no", "maybe"}
    assert result["*"] == "maybe"
    if name.startswith("dynamic"):
        assert result["ok"] == "yes"
        assert result["divide by zero"] == "yes"
    assert capsys.readouterr().out == ""


def test_real_combination_and_jpamb_scoring(bytecode):
    result = engine.run(
        ["static_sign", "static_string", "dynamic_small"], METHOD, bytecode=bytecode
    )
    response, warnings = Response.parse(
        "\n".join(f"{q};{p}" for q, p in result.items())
    )
    assert not warnings
    assert result["ok"] == result["divide by zero"] == "yes"
    assert result["null pointer"] == "no"
    method = jpamb.parse_methodid(METHOD)
    benchmark = bytecode.suite.benchmark(eff=bytecode.eff)
    expected = benchmark.experiments[jpamb.case.Experiment(method, None)].results
    trackers = {}
    for query, prediction in response.predictions.items():
        tracker = trackers.setdefault(prediction, Tracker())
        tracker.counts += 1
        tracker.hits += query in expected
    score = response.score(
        expected, {category: tracker.wager() for category, tracker in trackers.items()}
    )
    assert score == pytest.approx(6)
    assert response.predictions["*"] == Category("maybe")


def test_cli_metadata_and_method():
    command = [
        sys.executable,
        str(engine.ROOT / "engine.py"),
        "--analyses",
        "static_sign,static_string,dynamic_small",
    ]
    info = subprocess.run(
        [*command, "info"], cwd=engine.ROOT, capture_output=True, text=True, check=True
    )
    assert jpamb.AnalysisInfo.parse(info.stdout).name == "engine"
    method = subprocess.run(
        [*command, METHOD], cwd=engine.ROOT, capture_output=True, text=True, check=True
    )
    response, warnings = Response.parse(method.stdout)
    assert not warnings
    assert len(method.stdout.splitlines()) == len(jpamb.QUERIES)
    assert response.predictions["ok"] == Category("yes")
