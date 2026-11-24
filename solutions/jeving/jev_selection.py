from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any

BASE_DIR = Path(__file__).resolve().parent
RESULTS_DIR = BASE_DIR / "output" / "jev_results" / "per_method"
METHODS_DIR = BASE_DIR / "output" / "per_method"
OUTPUT_FILE = BASE_DIR / "output" / "analysis_selections.json"

# Selection thresholds
SINGLE_WINNER_MIN = 60.0
SINGLE_WINNER_LEAD = 15.0
COMBINATION_MIN = 20.0
NOUL_YES_MIN = 50.0
COVERAGE_ANALYZER = "dynamic_coverage"
STATIC_ANALYZERS = {"static_sign", "static_interval", "static_string"}
DYNAMIC_ANALYZERS = {"dynamic_random", "dynamic_small", "dynamic_mutation"}

# Must match the analyzer registry in the final jev_run.py.
ANALYZER_SUPPORTS = {
    "static_sign": {"int", "boolean"},
    "static_interval": {"int", "boolean"},
    "static_string": {"String", "boolean"},
    "dynamic_random": {"int", "boolean", "int[]", "char[]", "String"},
    "dynamic_small": {"int", "boolean"},
    "dynamic_mutation": {"int", "boolean"},
}

# These analyzers explicitly support a method with no parameters.
NO_PARAMETER_ANALYZERS = {
    "static_sign", "static_interval", "static_string", "dynamic_random", "dynamic_small"
}



def skip_quoted(source: str, pos: int) -> int:
    quote = source[pos]
    pos += 1
    while pos < len(source):
        if source[pos] == "\\":
            pos += 2
        elif source[pos] == quote:
            return pos + 1
        else:
            pos += 1
    return len(source)


def mask_comments_and_literals(source: str) -> str:
    """Blank comments and literals while preserving character positions."""
    chars = list(source)
    i = 0
    while i < len(source):
        if source.startswith("//", i):
            end = source.find("\n", i + 2)
            end = len(source) if end == -1 else end
        elif source.startswith("/*", i):
            close = source.find("*/", i + 2)
            end = len(source) if close == -1 else close + 2
        elif source.startswith('"""', i):
            close = source.find('"""', i + 3)
            end = len(source) if close == -1 else close + 3
        elif source[i] in ('"', "'"):
            end = skip_quoted(source, i)
        else:
            i += 1
            continue

        for j in range(i, end):
            if chars[j] not in "\r\n":
                chars[j] = " "
        i = end
    return "".join(chars)


def matching_delimiter(masked: str, opening_pos: int, opening: str, closing: str) -> int | None:
    if opening_pos >= len(masked) or masked[opening_pos] != opening:
        return None
    depth = 1
    for i in range(opening_pos + 1, len(masked)):
        if masked[i] == opening:
            depth += 1
        elif masked[i] == closing:
            depth -= 1
            if depth == 0:
                return i
    return None


def load_method_state(result_file: Path, method_id: str) -> dict[str, Any]:
    candidate = METHODS_DIR / result_file.name
    if candidate.exists():
        data = json.loads(candidate.read_text(encoding="utf-8"))
        state = data.get("state", data)
        if isinstance(state, dict):
            return state

    # Fallback for cases where the state file was named differently.
    for state_file in METHODS_DIR.glob("*.json"):
        data = json.loads(state_file.read_text(encoding="utf-8"))
        state = data.get("state", data)
        if isinstance(state, dict) and state.get("id") == method_id:
            return state

    raise FileNotFoundError(f"Could not find method state JSON for {method_id!r}")


def split_top_level(text: str, delimiter: str = ",") -> list[str]:
    """Split a Java parameter list without splitting generic/array expressions."""
    parts: list[str] = []
    start = 0
    angle = paren = bracket = 0
    for i, char in enumerate(text):
        if char == "<":
            angle += 1
        elif char == ">" and angle:
            angle -= 1
        elif char == "(":
            paren += 1
        elif char == ")" and paren:
            paren -= 1
        elif char == "[":
            bracket += 1
        elif char == "]" and bracket:
            bracket -= 1
        elif char == delimiter and angle == paren == bracket == 0:
            parts.append(text[start:i].strip())
            start = i + 1
    tail = text[start:].strip()
    if tail:
        parts.append(tail)
    return parts


def normalize_java_type(type_text: str) -> str:
    type_text = re.sub(r"@\w+(?:\([^)]*\))?\s*", "", type_text)
    type_text = re.sub(r"\b(final|volatile|transient)\b", "", type_text)
    type_text = type_text.strip().replace("...", "[]")
    type_text = re.sub(r"\s*\[\s*\]", "[]", type_text)
    type_text = re.sub(r"\s+", " ", type_text)
    # Generic/container types are not supported by any analyzer in this registry.
    if "<" in type_text:
        return type_text.split("<", 1)[0].strip()
    return type_text


def parameter_type_from_declaration(declaration: str) -> str | None:
    declaration = re.sub(r"@\w+(?:\([^)]*\))?\s*", "", declaration).strip()
    declaration = re.sub(r"\bfinal\b", "", declaration).strip()
    if not declaration:
        return None
    tokens = declaration.rsplit(None, 1)
    if len(tokens) < 2:
        return None
    # The final token is the parameter name; everything before it is its type.
    return normalize_java_type(tokens[0])


def extract_parameter_types(method_state: dict[str, Any]) -> tuple[list[str] | None, str | None]:
    """Read parameter types from structured metadata or the Java method signature."""
    parameters = method_state.get("parameters")
    if isinstance(parameters, list):
        types: list[str] = []
        for parameter in parameters:
            if isinstance(parameter, dict):
                raw_type = parameter.get("type") or parameter.get("parameter_type")
                if not raw_type:
                    declaration = parameter.get("source") or parameter.get("declaration")
                    raw_type = parameter_type_from_declaration(str(declaration)) if declaration else None
            elif isinstance(parameter, str):
                raw_type = parameter_type_from_declaration(parameter)
            else:
                raw_type = None
            if not raw_type:
                return None, "Could not determine the type of every structured parameter."
            types.append(normalize_java_type(str(raw_type)))
        return types, None

    source = method_state.get("source") or method_state.get("signature")
    if not isinstance(source, str) or not source.strip():
        return None, "No method source/signature was available to determine parameter types."

    method_name = method_state.get("method_name") or str(method_state.get("id", "")).rsplit(".", 1)[-1]
    masked = mask_comments_and_literals(source)
    match = re.search(rf"\b{re.escape(str(method_name))}\s*\(", masked)
    if not match:
        return None, f"Could not locate the signature for method {method_name!r}."
    opening = masked.find("(", match.start())
    closing = matching_delimiter(masked, opening, "(", ")")
    if closing is None:
        return None, "Could not parse the method parameter list."

    parameter_text = source[opening + 1:closing].strip()
    if not parameter_text:
        return [], None

    types = []
    for declaration in split_top_level(parameter_text):
        parameter_type = parameter_type_from_declaration(declaration)
        if not parameter_type:
            return None, f"Could not parse parameter declaration: {declaration!r}."
        types.append(parameter_type)
    return types, None


def compatible_analyzers(parameter_types: list[str] | None) -> tuple[set[str], str | None]:
    if parameter_types is None:
        # Compatibility is a hard constraint: unknown parameter types require review.
        return set(), "Parameter compatibility could not be verified; analyzer selection requires manual review."
    if not parameter_types:
        return set(NO_PARAMETER_ANALYZERS), None
    return {
        name for name, supported in ANALYZER_SUPPORTS.items()
        if all(parameter_type in supported for parameter_type in parameter_types)
    }, None


def choose_primary(primary_answer: dict[str, Any], compatible: set[str]) -> list[str]:
    """Choose the primary analyzer(s) using the winner or combination rule."""
    probabilities = primary_answer.get("probabilities_percent", {})
    if not isinstance(probabilities, dict):
        probabilities = {}

    ranked = sorted(
        ((name, float(score)) for name, score in probabilities.items() if name in compatible),
        key=lambda item: item[1],
        reverse=True,
    )
    if not ranked:
        return []

    first_name, first_score = ranked[0]
    second_score = ranked[1][1] if len(ranked) > 1 else 0.0
    lead = first_score - second_score

    # A clear winner is selected alone if it reaches either confidence condition.
    if first_score >= SINGLE_WINNER_MIN or lead >= SINGLE_WINNER_LEAD:
        return [first_name]

    # Otherwise, use the combination rule.
    return [name for name, score in ranked if score >= COMBINATION_MIN]


def choose_complementary_analyzer(
    answers: dict[str, Any],
    primary_selected: list[str],
    compatible: set[str],
    parameter_types: list[str] | None,
) -> str | None:
    """If Jev says yes, choose one compatible analyzer from the opposite family."""
    if yes_probability(answers, "needs_complementary_analysis") < NOUL_YES_MIN:
        return None

    static_selected = any(name in STATIC_ANALYZERS for name in primary_selected)
    dynamic_selected = any(name in DYNAMIC_ANALYZERS for name in primary_selected)

    # A mixed primary set already covers both analysis families.
    if static_selected == dynamic_selected:
        return None

    understanding = answers.get("method_understanding", {})
    category = understanding.get("selected") if isinstance(understanding, dict) else None
    parameter_types = parameter_types or []

    if static_selected:
        # Primary is static: select a dynamic complement.
        if any(t in {"String", "int[]", "char[]"} for t in parameter_types):
            candidate = "dynamic_random"
        elif len(parameter_types) > 2:
            candidate = "dynamic_random"
        else:
            candidate = "dynamic_small"
        return candidate if candidate in compatible and candidate not in primary_selected else None

    # Primary is dynamic: select a static complement only when static reasoning
    # is meaningful for this method and compatible with every parameter.
    if category in {"calls_recursion_or_cast", "loop_logic", "array_logic"}:
        return None

    if "String" in parameter_types:
        candidate = "static_string"
    elif all(t in {"int", "boolean"} for t in parameter_types):
        candidate = "static_interval"
    else:
        return None

    return candidate if candidate in compatible and candidate not in primary_selected else None


def yes_probability(answers: dict[str, Any], question_name: str) -> float:
    answer = answers.get(question_name, {})
    if not isinstance(answer, dict):
        return 0.0
    return float(answer.get("yes_probability_percent", 0.0))


def main() -> None:
    if not RESULTS_DIR.exists():
        raise SystemExit(f"Jev result directory not found: {RESULTS_DIR}")
    if not METHODS_DIR.exists():
        raise SystemExit(f"Method state directory not found: {METHODS_DIR}")

    result_files = sorted(RESULTS_DIR.glob("*.json"))
    if not result_files:
        raise SystemExit(
            "No Jev result JSON files found in: "
            f"{RESULTS_DIR}\nRun jev_run.py first and check that it saved per-method results."
        )

    selections: list[dict[str, Any]] = []

    for result_file in result_files:
        print(f"Processing: {result_file.name}")
        result = json.loads(result_file.read_text(encoding="utf-8"))
        method_id = result["method_id"]
        answers = result.get("answers", {})
        method_state = load_method_state(result_file, method_id)

        parameter_types, parameter_warning = extract_parameter_types(method_state)
        compatible, compatibility_warning = compatible_analyzers(parameter_types)
        if compatibility_warning:
            print(f"  Compatibility warning: {compatibility_warning}")
        else:
            print(f"  Parameter types: {parameter_types}")

        primary = answers.get("primary_analyzer", {})
        if not isinstance(primary, dict):
            primary = {}
        selected = choose_primary(primary, compatible)

        # Jev only answers whether an opposite-family complement is useful.
        # Python deterministically chooses the concrete compatible analyzer.
        secondary = choose_complementary_analyzer(
            answers, selected, compatible, parameter_types
        )
        if secondary:
            selected.append(secondary)

        # The coverage analyzer handles dictionary/literal discovery itself.
        # Jev's Noul answer therefore only controls whether dynamic_coverage
        # is included; this script does not extract or construct dictionary data.
        coverage_requested = yes_probability(answers, "use_dictionary") >= NOUL_YES_MIN
        if coverage_requested and COVERAGE_ANALYZER not in selected:
            selected.append(COVERAGE_ANALYZER)

        print(f"  Compatible analyzers: {sorted(compatible)}")
        print(f"  Selected analyzers: {selected}")

        # Keep the output deliberately minimal: method identifier and the
        # analyzers that should run. No diagnostics, metadata, or dictionaries.
        selections.append(
            {
                "method_id": method_id,
                "selected_analyzers": selected,
            }
        )

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_FILE.write_text(
        json.dumps(selections, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(f"Saved {len(selections)} method selection(s) to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
