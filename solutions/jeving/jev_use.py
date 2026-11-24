"""Run the Jev analysis pipeline once and read per-method analyzer selections.

Place this file in pa-code/solutions/jeving/, beside:
    method_to_json.py
    jev_run.py
    jev_selection.py

From another Python file, call run_pipeline(api_key) once, then call
get_analyzers(method_id) as often as needed. get_analyzers() only reads the
saved JSON file; it never calls the Jev API or reruns the pipeline.

How to use:
import os
import sys
from pathlib import Path

PA_CODE_DIR = Path(__file__).resolve().parent
JEVING_DIR = PA_CODE_DIR / "solutions" / "jeving"

sys.path.insert(0, str(JEVING_DIR))

from run_jev_pipeline import run_pipeline, get_analyzers

run_pipeline(api_key=os.environ["TYPESAFE_API_KEY"])
for method_id in methods_to_process: 
    analyzers = get_analyzers(method_id)
    or other way just use get_analyzers for each method

linux : export TYPESAFE_API_KEY="YOUR_API_KEY"
Win: $env:TYPESAFE_API_KEY="YOUR_API_KEY"
"""

from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path
from typing import Any


JEVING_DIR = Path(__file__).resolve().parent
SELECTION_FILE = JEVING_DIR / "output" / "analysis_selections.json"


class PipelineError(RuntimeError):
    """Raised when a pipeline step fails or its output is invalid."""


def _load_selections() -> list[dict[str, Any]]:
    """Read and validate the analyzer-selection JSON file."""
    if not SELECTION_FILE.is_file():
        raise FileNotFoundError(
            f"Selection file not found: {SELECTION_FILE}. Run run_pipeline() first."
        )

    try:
        records = json.loads(SELECTION_FILE.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise ValueError(f"Invalid JSON in {SELECTION_FILE}") from exc

    if not isinstance(records, list):
        raise ValueError("analysis_selections.json must contain a JSON array.")

    seen: set[str] = set()
    for index, record in enumerate(records):
        if not isinstance(record, dict):
            raise ValueError(f"Selection at index {index} must be a JSON object.")

        method_id = record.get("method_id")
        analyzers = record.get("selected_analyzers")
        if not isinstance(method_id, str) or not method_id.strip():
            raise ValueError(f"Selection at index {index} has an invalid method_id.")
        if method_id in seen:
            raise ValueError(f"Duplicate method_id in selection file: {method_id}")
        if not isinstance(analyzers, list) or not all(
            isinstance(name, str) and name.strip() for name in analyzers
        ):
            raise ValueError(f"Invalid selected_analyzers for method: {method_id}")
        seen.add(method_id)

    return records


def run_pipeline(api_key: str) -> None:
    """Run export, Jev analysis, and analyzer selection, in that order.

    This is the only function that runs scripts or needs the Typesafe API key.
    Call it once before retrieving analyzer lists with get_analyzers().
    """
    if not isinstance(api_key, str) or not api_key.strip():
        raise ValueError("A non-empty Typesafe API key is required.")

    # Prefer the user's requested filename; also support the exporter filename
    # that was supplied with the current project files.
    exporter_candidates = ("method_to_json.py", "jev_compact_case_states.py")
    exporter_name = next(
        (name for name in exporter_candidates if (JEVING_DIR / name).is_file()),
        None,
    )
    if exporter_name is None:
        expected = " or ".join(str(JEVING_DIR / name) for name in exporter_candidates)
        raise FileNotFoundError(f"Java-method exporter not found. Expected: {expected}")

    scripts = (
        (exporter_name, "Export Java methods"),
        ("jev_run.py", "Run Jev analysis"),
        ("jev_selection.py", "Select analyzers"),
    )

    for script_name, description in scripts:
        script_path = JEVING_DIR / script_name
        if not script_path.is_file():
            raise FileNotFoundError(f"Required pipeline script not found: {script_path}")

    env = os.environ.copy()
    env["TYPESAFE_API_KEY"] = api_key.strip()

    for index, (script_name, description) in enumerate(scripts, start=1):
        script_path = JEVING_DIR / script_name
        print(f"[{index}/3] {description}: {script_name}", flush=True)
        try:
            subprocess.run(
                [sys.executable, str(script_path)],
                cwd=JEVING_DIR,
                env=env,
                check=True,
            )
        except subprocess.CalledProcessError as exc:
            raise PipelineError(
                f"{script_name} failed with exit code {exc.returncode}; "
                "the remaining steps were not run."
            ) from exc
        except OSError as exc:
            raise PipelineError(f"Could not start {script_name}: {exc}") from exc

    records = _load_selections()
    print(
        f"Pipeline completed. Selections are available for {len(records)} methods.",
        flush=True,
    )


def get_analyzers(method_id: str) -> list[str]:
    """Return only the analyzer-name list for one method; makes no API calls."""
    if not isinstance(method_id, str) or not method_id.strip():
        raise ValueError("method_id must be a non-empty string.")

    for record in _load_selections():
        if record["method_id"] == method_id:
            return list(record["selected_analyzers"])

    raise KeyError(f"No analyzer selection found for method: {method_id}")
