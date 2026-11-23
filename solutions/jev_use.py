"""Shared helper for reading analyzer selections and dictionary entries.

PLACE THIS FILE HERE:
    pa-code/solutions/analysis_plan.py

The helper reads BOTH the selected analyzers AND dictionary entries from the
same combined file created by analysisList.py:
    pa-code/solutions/jeving/output/analysis_selections.json

HOW TO USE FROM solutions/dynamic/dynamic.py OR solutions/static/static.py:

    from pathlib import Path
    import sys

    # Add pa-code/solutions to Python's import path.
    SOLUTIONS_DIR = Path(__file__).resolve().parents[1]
    sys.path.insert(0, str(SOLUTIONS_DIR))

    from analysis_plan import get_method_plan

    # Use the exact method_id stored in analysis_selections.json.
    analyzers, dictionary = get_method_plan(method_id)

    # Example:
    # analyzers   -> ["dynamic_random", "static_sign"]
    # dictionary -> {"int": [0, 42], "string": ["admin", "guest"]}
    # If no dictionary is enabled, dictionary is {}.

You can also import the smaller helpers:
    from analysis_plan import get_analyzers, get_dictionary, needs_dictionary

    analyzers = get_analyzers(method_id)
    dictionary = get_dictionary(method_id)
    enabled = needs_dictionary(method_id)

Optional custom path:
    analyzers, dictionary = get_method_plan(
        method_id,
        selection_file="/path/to/analysis_selections.json",
    )
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any

# This file is expected to live directly in pa-code/solutions/.
# Analyzer selections and dictionary entries are read together from this file.
DEFAULT_SELECTION_FILE = (
    Path(__file__).resolve().parent
    / "jeving"
    / "output"
    / "analysis_selections.json"
)


def _load_method_record(
    method_id: str,
    selection_file: str | Path | None = None,
) -> dict[str, Any]:
    """Load one method's record from the combined analysis_selections.json."""
    path = Path(selection_file).expanduser() if selection_file else DEFAULT_SELECTION_FILE
    if not path.is_absolute():
        path = (Path.cwd() / path).resolve()

    if not path.is_file():
        raise FileNotFoundError(f"Analysis selections file not found: {path}")

    try:
        records = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise ValueError(f"Invalid JSON in selection file: {path}") from exc

    if not isinstance(records, list):
        raise ValueError("analysis_selections.json must contain a JSON list.")

    matches = [
        item for item in records
        if isinstance(item, dict) and item.get("method_id") == method_id
    ]
    if not matches:
        raise KeyError(f"No selection found for method: {method_id}")
    if len(matches) > 1:
        raise ValueError(f"Duplicate selection records found for method: {method_id}")

    return matches[0]


def get_method_plan(
    method_id: str,
    selection_file: str | Path | None = None,
) -> tuple[list[str], dict[str, list[Any]]]:
    """Return (selected analyzers, dictionary entries) for a method.

    Both are loaded from the SAME method record in analysis_selections.json.
    The dictionary is {} if use_dictionary is false or there are no entries.
    """
    record = _load_method_record(method_id, selection_file)

    analyzers = record.get("selected_analyzers", [])
    if not isinstance(analyzers, list) or not all(
        isinstance(name, str) for name in analyzers
    ):
        raise ValueError(f"Invalid selected_analyzers for method: {method_id}")

    dictionary: dict[str, list[Any]] = {}
    if record.get("use_dictionary", False):
        entries = record.get("dictionary_entries", {})
        if not isinstance(entries, dict):
            raise ValueError(f"Invalid dictionary_entries for method: {method_id}")
        for value_type, values in entries.items():
            if not isinstance(values, list):
                raise ValueError(
                    f"Dictionary entry {value_type!r} must be a list for {method_id}"
                )
            if values:
                dictionary[str(value_type)] = values

    return list(analyzers), dictionary


def get_analyzers(
    method_id: str,
    selection_file: str | Path | None = None,
) -> list[str]:
    """Return only the selected analyzer names for one method."""
    analyzers, _ = get_method_plan(method_id, selection_file)
    return analyzers


def get_dictionary(
    method_id: str,
    selection_file: str | Path | None = None,
) -> dict[str, list[Any]]:
    """Return only this method's dictionary entries from analysis_selections.json."""
    _, dictionary = get_method_plan(method_id, selection_file)
    return dictionary


def needs_dictionary(
    method_id: str,
    selection_file: str | Path | None = None,
) -> bool:
    """Return whether this method has dictionary entries enabled and available."""
    return bool(get_dictionary(method_id, selection_file))
