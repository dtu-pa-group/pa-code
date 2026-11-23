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

DYNAMIC_ANALYZERS = {"dynamic_random", "dynamic_small", "dynamic_mutation"}
STATIC_ANALYZERS = {"static_sign", "static_interval", "static_string"}

INTEGER_RE = re.compile(
    r"(?:0[xX][0-9a-fA-F](?:[0-9a-fA-F_]*[0-9a-fA-F])?"
    r"|0[bB][01](?:[01_]*[01])?"
    r"|0[0-7](?:[0-7_]*[0-7])?"
    r"|[1-9](?:[0-9_]*[0-9])?|0)[lL]?"
)
FLOAT_RE = re.compile(
    r"(?:[0-9][0-9_]*\.[0-9_]*(?:[eE][+-]?[0-9_]+)?"
    r"|\.[0-9][0-9_]*(?:[eE][+-]?[0-9_]+)?"
    r"|[0-9][0-9_]*[eE][+-]?[0-9_]+)[fFdD]?"
)


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


def method_body(source: str, method_name: str | None) -> str:
    """Get only the method body, excluding @Case/@Tag annotation strings."""
    masked = mask_comments_and_literals(source)
    body_open = None

    if method_name:
        match = re.search(rf"\b{re.escape(method_name)}\s*\(", masked)
        if match:
            paren_open = masked.find("(", match.start())
            paren_close = matching_delimiter(masked, paren_open, "(", ")")
            if paren_close is not None:
                body_open = masked.find("{", paren_close + 1)

    if body_open is None:
        # Fallback for compact helper records that do not contain a method_name.
        body_open = masked.find("{")

    if body_open == -1 or body_open is None:
        return source

    body_close = matching_delimiter(masked, body_open, "{", "}")
    if body_close is None:
        return source[body_open + 1:]
    return source[body_open + 1:body_close]


def decode_java_escapes(value: str) -> str:
    replacements = {
        "\\b": "\b", "\\t": "\t", "\\n": "\n", "\\f": "\f",
        "\\r": "\r", '\\"': '"', "\\'": "'", "\\\\": "\\",
    }
    for old, new in replacements.items():
        value = value.replace(old, new)
    value = re.sub(
        r"\\u+([0-9a-fA-F]{4})",
        lambda m: chr(int(m.group(1), 16)),
        value,
    )
    value = re.sub(
        r"\\([0-7]{1,3})",
        lambda m: chr(int(m.group(1), 8)),
        value,
    )
    return value


def parse_integer(raw: str) -> int | None:
    cleaned = raw.replace("_", "").rstrip("lL")
    try:
        if cleaned.lower().startswith("0x"):
            value = int(cleaned[2:], 16)
        elif cleaned.lower().startswith("0b"):
            value = int(cleaned[2:], 2)
        elif len(cleaned) > 1 and cleaned.startswith("0"):
            value = int(cleaned, 8)
        else:
            value = int(cleaned, 10)
        if -(2**31) <= value <= (2**31 - 1):
            return value
    except ValueError:
        pass
    return None


def scan_literals(code: str) -> dict[str, list[Any]]:
    found: dict[str, list[Any]] = {
        "int": [],
        "string": [],
        "char": [],
        "char_array": [],
        "int_array": [],
    }

    def add(kind: str, value: Any) -> None:
        if value not in found[kind]:
            found[kind].append(value)

    i = 0
    while i < len(code):
        if code.startswith("//", i):
            end = code.find("\n", i + 2)
            i = len(code) if end == -1 else end + 1
            continue
        if code.startswith("/*", i):
            end = code.find("*/", i + 2)
            i = len(code) if end == -1 else end + 2
            continue

        if code.startswith('"""', i):
            end = code.find('"""', i + 3)
            if end == -1:
                break
            add("string", code[i + 3:end])
            i = end + 3
            continue

        if code[i] == '"':
            end = skip_quoted(code, i)
            if end <= len(code) and code[end - 1:end] == '"':
                value = decode_java_escapes(code[i + 1:end - 1])
                add("string", value)
                if value:
                    add("char_array", value)
            i = end
            continue

        if code[i] == "'":
            end = skip_quoted(code, i)
            if end <= len(code) and code[end - 1:end] == "'":
                value = decode_java_escapes(code[i + 1:end - 1])
                if len(value) == 1:
                    add("char", value)
            i = end
            continue

        # Skip floating-point constants; they are not seeds for the current int analyzers.
        float_match = FLOAT_RE.match(code, i)
        if float_match:
            i = float_match.end()
            continue

        number_start = i
        sign = ""
        if code[i] in "+-" and i + 1 < len(code) and code[i + 1].isdigit():
            prev = code[i - 1] if i > 0 else " "
            if not (prev.isalnum() or prev in "_$."):
                sign = code[i]
                number_start = i + 1

        number_match = INTEGER_RE.match(code, number_start)
        if number_match:
            end = number_match.end()
            next_char = code[end] if end < len(code) else ""
            if not (next_char.isalnum() or next_char in "_.$"):
                value = parse_integer(sign + number_match.group(0))
                if value is not None:
                    add("int", value)
                i = end
                continue

        i += 1

    # Preserve whole array values as seeds too, not only their individual elements.
    array_patterns = (
        ("char", re.compile(r"\bnew\s+char\s*\[\s*\]\s*\{([^{}]*)\}")),
        ("char", re.compile(r"\bchar\s*\[\s*\]\s+[A-Za-z_$][\w$]*\s*=\s*\{([^{}]*)\}")),
    )
    for _, pattern in array_patterns:
        for match in pattern.finditer(code):
            values = scan_literals(match.group(1))["char"]
            if values:
                add("char_array", "".join(values))

    int_array_patterns = (
        re.compile(r"\bnew\s+int\s*\[\s*\]\s*\{([^{}]*)\}"),
        re.compile(r"\bint\s*\[\s*\]\s+[A-Za-z_$][\w$]*\s*=\s*\{([^{}]*)\}"),
    )
    for pattern in int_array_patterns:
        for match in pattern.finditer(code):
            values = scan_literals(match.group(1))["int"]
            if values:
                add("int_array", values)

    return {kind: values for kind, values in found.items() if values}


def source_and_helpers(method_state: dict[str, Any]) -> list[tuple[str | None, str]]:
    sources: list[tuple[str | None, str]] = []
    method_name = method_state.get("method_name")
    if not method_name:
        method_name = str(method_state.get("id", "")).rsplit(".", 1)[-1]

    # Prefer body when supplied; otherwise parse the complete source method.
    body = method_state.get("body")
    source = method_state.get("source")
    if isinstance(body, str) and body.strip():
        sources.append((method_name, body))
    elif isinstance(source, str) and source.strip():
        sources.append((method_name, method_body(source, method_name)))

    helpers = method_state.get("helpers", [])
    if isinstance(helpers, list):
        for helper in helpers:
            if not isinstance(helper, dict):
                continue
            helper_source = helper.get("body") or helper.get("source")
            if isinstance(helper_source, str) and helper_source.strip():
                helper_name = helper.get("method_name")
                if not helper.get("body"):
                    helper_source = method_body(helper_source, helper_name)
                sources.append((helper_name, helper_source))

    return sources


def extract_method_dictionary(method_state: dict[str, Any]) -> dict[str, list[Any]]:
    combined: dict[str, list[Any]] = {}
    for _, code in source_and_helpers(method_state):
        literals = scan_literals(code)
        for kind, values in literals.items():
            target = combined.setdefault(kind, [])
            for value in values:
                if value not in target:
                    target.append(value)
    return combined


def safe_stem(method_id: str) -> str:
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", method_id)


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


def choose_primary(probabilities: dict[str, float]) -> list[str]:
    ranked = sorted(probabilities.items(), key=lambda item: item[1], reverse=True)
    if not ranked:
        return []

    first_name, first_score = ranked[0]
    second_score = ranked[1][1] if len(ranked) > 1 else 0.0

    if first_score >= SINGLE_WINNER_MIN and first_score - second_score >= SINGLE_WINNER_LEAD:
        return [first_name]

    return [name for name, score in ranked if score >= COMBINATION_MIN]


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

    selections: list[dict[str, Any]] = []

    for result_file in sorted(RESULTS_DIR.glob("*.json")):
        result = json.loads(result_file.read_text(encoding="utf-8"))
        method_id = result["method_id"]
        answers = result.get("answers", {})

        primary = answers.get("primary_analyzer", {})
        probabilities = primary.get("probabilities_percent", {})
        selected = choose_primary(probabilities)

        use_dictionary = yes_probability(answers, "use_dictionary") >= NOUL_YES_MIN
        dictionary_entries: dict[str, list[Any]] = {}
        if use_dictionary:
            method_state = load_method_state(result_file, method_id)
            dictionary_entries = extract_method_dictionary(method_state)
            # Do not claim a dictionary is enabled if there were no usable literals.
            use_dictionary = bool(dictionary_entries)

        run_secondary = yes_probability(answers, "run_secondary_static") >= NOUL_YES_MIN
        has_dynamic = any(name in DYNAMIC_ANALYZERS for name in selected)
        has_static = any(name in STATIC_ANALYZERS for name in selected)
        if run_secondary and has_dynamic and not has_static:
            if "static_sign" not in selected:
                selected.append("static_sign")

        selections.append(
            {
                "method_id": method_id,
                "selected_analyzers": selected,
                "use_dictionary": use_dictionary,
                "dictionary_entries": dictionary_entries,
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
