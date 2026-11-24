#!/usr/bin/env python3
"""Export one compact Jev state per @Case-annotated JPAMB Java method.

@Case is used ONLY to identify target methods. Its arguments and expected
outcomes are deliberately not exported to Jev. Methods without @Case are
included only as helper implementations when called by a target method.

Each state is written separately under output/per_method/. No combined
all-methods JSON is generated. Imports are not exported.

Place this script in pa-code/solutions/jeving/.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path
from typing import Any, Optional

# Keep this script in solutions/jeving. parents[2] resolves to pa-code.
PROJECT_ROOT = Path(__file__).resolve().parents[2]
CASES_DIR = PROJECT_ROOT / "cases" / "jpamb" / "cases"
INPUT_DIR = CASES_DIR
OUTPUT_DIR = Path(__file__).resolve().parent / "output"

IDENTIFIER = re.compile(r"[A-Za-z_$][A-Za-z0-9_$]*")
PACKAGE_RE = re.compile(r"\bpackage\s+([A-Za-z_$][\w$]*(?:\.[A-Za-z_$][\w$]*)*)\s*;")
TYPE_RE = re.compile(r"\b(class|interface|enum|record)\s+([A-Za-z_$][\w$]*)\b")
CALL_RE = re.compile(r"\b([A-Za-z_$][A-Za-z0-9_$]*)\s*\(")

CONTROL_OR_LANGUAGE_WORDS = {
    "if", "for", "while", "switch", "catch", "synchronized", "try",
    "assert", "return", "throw", "new", "this", "super", "do",
    "case", "while", "instanceof", "yield",
}

OBJECTIVE = (
    "Select the analysis technique or combination of techniques that best fits "
    "this Java test method. Use only the supplied analysis catalogue and each "
    "technique's selection criteria. Base the decision on the method implementation "
    "and relevant helper code; do not infer behavior "
    "from the method name alone or invent analysis techniques."
)



def skip_quoted_or_comment(source: str, pos: int) -> int:
    """Return the first position after a comment or Java literal."""
    n = len(source)
    if source.startswith("//", pos):
        end = source.find("\n", pos + 2)
        return n if end == -1 else end + 1
    if source.startswith("/*", pos):
        end = source.find("*/", pos + 2)
        return n if end == -1 else end + 2
    if source.startswith('"""', pos):
        end = source.find('"""', pos + 3)
        return n if end == -1 else end + 3

    quote = source[pos]
    if quote not in ('"', "'"):
        return pos
    pos += 1
    while pos < n:
        if source[pos] == "\\":
            pos += 2
        elif source[pos] == quote:
            return pos + 1
        else:
            pos += 1
    return n


def skip_trivia(source: str, pos: int) -> int:
    """Skip whitespace and comments."""
    n = len(source)
    while pos < n:
        if source[pos].isspace():
            pos += 1
        elif source.startswith("//", pos) or source.startswith("/*", pos):
            pos = skip_quoted_or_comment(source, pos)
        else:
            break
    return pos


def find_matching(source: str, opening_pos: int, opening: str, closing: str) -> Optional[int]:
    """Find a matching delimiter, ignoring comments and literals."""
    if opening_pos >= len(source) or source[opening_pos] != opening:
        return None
    depth = 1
    pos = opening_pos + 1
    while pos < len(source):
        if source.startswith("//", pos) or source.startswith("/*", pos) or source.startswith('"""', pos):
            pos = skip_quoted_or_comment(source, pos)
            continue
        if source[pos] in ('"', "'"):
            pos = skip_quoted_or_comment(source, pos)
            continue
        if source[pos] == opening:
            depth += 1
        elif source[pos] == closing:
            depth -= 1
            if depth == 0:
                return pos
        pos += 1
    return None


def mask_non_code(source: str) -> str:
    """Replace comments and literals with spaces while preserving positions."""
    chars = list(source)
    pos = 0
    while pos < len(source):
        if source.startswith("//", pos) or source.startswith("/*", pos) or source.startswith('"""', pos):
            end = skip_quoted_or_comment(source, pos)
            for j in range(pos, end):
                if chars[j] not in "\r\n":
                    chars[j] = " "
            pos = end
        elif source[pos] in ('"', "'"):
            end = skip_quoted_or_comment(source, pos)
            for j in range(pos, end):
                if chars[j] not in "\r\n":
                    chars[j] = " "
            pos = end
        else:
            pos += 1
    return "".join(chars)


def parse_annotation_at(source: str, pos: int) -> Optional[dict[str, Any]]:
    """Parse one annotation beginning at @."""
    if pos >= len(source) or source[pos] != "@":
        return None
    start = pos
    pos += 1
    match = IDENTIFIER.match(source, pos)
    if not match:
        return None
    name_parts = [match.group(0)]
    pos = match.end()
    while pos < len(source) and source[pos] == ".":
        match = IDENTIFIER.match(source, pos + 1)
        if not match:
            break
        name_parts.append(match.group(0))
        pos = match.end()

    pos = skip_trivia(source, pos)
    args = ""
    end = pos
    if pos < len(source) and source[pos] == "(":
        close = find_matching(source, pos, "(", ")")
        if close is None:
            return None
        args = source[pos + 1:close]
        end = close + 1
    return {"name": ".".join(name_parts), "args": args, "start": start, "end": end,
            "source": source[start:end]}


def find_annotations(header: str) -> list[dict[str, Any]]:
    """Find annotations in a method header, without matching comments/literals."""
    masked = mask_non_code(header)
    annotations: list[dict[str, Any]] = []
    pos = 0
    while pos < len(header):
        if masked[pos] == "@":
            annotation = parse_annotation_at(header, pos)
            if annotation:
                annotations.append(annotation)
                pos = annotation["end"]
                continue
        pos += 1
    return annotations


def remove_spans(text: str, spans: list[tuple[int, int]]) -> str:
    chars = list(text)
    for start, end in spans:
        for pos in range(start, end):
            if chars[pos] not in "\r\n":
                chars[pos] = " "
    return "".join(chars)


def metadata_from_annotations(annotations: list[dict[str, Any]]) -> tuple[list[str], bool, bool]:
    """Extract optional @Tag values and detect @Case without reading its payload."""
    tags: list[str] = []
    has_tag = False
    has_case = False
    for annotation in annotations:
        simple_name = annotation["name"].split(".")[-1]
        if simple_name == "Tag":
            has_tag = True
            for token in IDENTIFIER.findall(annotation["args"]):
                if token not in tags and token != "value":
                    tags.append(token)
        elif simple_name == "Case":
            # Presence alone determines whether this method is a Jev state.
            # The annotation arguments are intentionally never parsed or exported.
            has_case = True
    return tags, has_tag, has_case


def find_type_opening(source: str, search_from: int) -> Optional[int]:
    """Find a type body's opening brace, ignoring braces in annotations/literals."""
    pos = search_from
    paren_depth = 0
    bracket_depth = 0
    while pos < len(source):
        if source.startswith("//", pos) or source.startswith("/*", pos) or source.startswith('"""', pos):
            pos = skip_quoted_or_comment(source, pos)
            continue
        if source[pos] in ('"', "'"):
            pos = skip_quoted_or_comment(source, pos)
            continue
        ch = source[pos]
        if ch == "(":
            paren_depth += 1
        elif ch == ")":
            paren_depth = max(0, paren_depth - 1)
        elif ch == "[":
            bracket_depth += 1
        elif ch == "]":
            bracket_depth = max(0, bracket_depth - 1)
        elif ch == "{" and paren_depth == 0 and bracket_depth == 0:
            return pos
        elif ch == ";" and paren_depth == 0 and bracket_depth == 0:
            return None
        pos += 1
    return None


def find_types(source: str, relative_path: str) -> list[dict[str, Any]]:
    masked = mask_non_code(source)
    types: list[dict[str, Any]] = []
    for match in TYPE_RE.finditer(masked):
        opening = find_type_opening(source, match.end())
        if opening is None:
            continue
        closing = find_matching(source, opening, "{", "}")
        if closing is None:
            continue
        types.append({
            "kind": match.group(1),
            "name": match.group(2),
            "start": match.start(),
            "open": opening,
            "close": closing,
            "source": source[match.start():closing + 1],
            "source_file": relative_path,
        })
    return types


def identify_method(header: str, class_name: str) -> Optional[dict[str, Any]]:
    """Best-effort check that a class-level member header declares a method."""
    annotations = find_annotations(header)
    clean = remove_spans(header, [(a["start"], a["end"]) for a in annotations])
    clean = mask_non_code(clean)

    # An assignment or lambda before a brace normally indicates a field
    # initializer / anonymous class, not a method declaration.
    if "=" in clean or "->" in clean:
        return None

    # The final parenthesis pair in a method header is normally its parameter list.
    open_paren = clean.rfind("(")
    if open_paren < 0:
        return None
    close_paren = find_matching(clean, open_paren, "(", ")")
    if close_paren is None:
        return None

    before = clean[:open_paren]
    name_match = re.search(r"([A-Za-z_$][A-Za-z0-9_$]*)\s*$", before)
    if not name_match:
        return None
    method_name = name_match.group(1)
    if method_name in CONTROL_OR_LANGUAGE_WORDS:
        return None

    prefix = before[:name_match.start()].strip()
    # A constructor has no return type; otherwise there should be a return type
    # (possibly with modifiers / generic type parameters) before the method name.
    if not prefix and method_name != class_name:
        return None

    # After the parameter list, Java permits a throws clause and whitespace.
    tail = clean[close_paren + 1:].strip()
    if tail and not re.match(r"^throws\b", tail):
        return None

    return {"method_name": method_name, "annotations": annotations}


def extract_methods_from_type(source: str, type_info: dict[str, Any]) -> tuple[list[dict[str, Any]], list[str]]:
    methods: list[dict[str, Any]] = []
    warnings: list[str] = []
    pos = type_info["open"] + 1
    segment_start = pos
    paren_depth = 0
    bracket_depth = 0
    nested_brace_depth = 0
    type_close = type_info["close"]

    while pos < type_close:
        if source.startswith("//", pos) or source.startswith("/*", pos) or source.startswith('"""', pos):
            pos = skip_quoted_or_comment(source, pos)
            continue
        if source[pos] in ('"', "'"):
            pos = skip_quoted_or_comment(source, pos)
            continue

        ch = source[pos]
        if ch == "(":
            paren_depth += 1
        elif ch == ")":
            paren_depth = max(0, paren_depth - 1)
        elif ch == "[":
            bracket_depth += 1
        elif ch == "]":
            bracket_depth = max(0, bracket_depth - 1)
        elif ch == "{":
            if paren_depth == 0 and bracket_depth == 0 and nested_brace_depth == 0:
                header = source[segment_start:pos]
                method_info = identify_method(header, type_info["name"])
                body_close = find_matching(source, pos, "{", "}")
                if body_close is None or body_close > type_close:
                    warnings.append(f"Unmatched body brace in {type_info['source_file']} ({type_info['name']})")
                    break
                if method_info:
                    annotations = method_info["annotations"]
                    tags, has_tag, has_case = metadata_from_annotations(annotations)
                    method_source = source[segment_start:body_close + 1].strip()
                    signature = header.strip()
                    header_leading_space = len(header) - len(header.lstrip())
                    body_source = source[pos:body_close + 1]
                    method_id = ".".join(part for part in (
                        # Package is attached later by the caller.
                        type_info.get("package", ""), type_info["name"], method_info["method_name"]
                    ) if part)
                    methods.append({
                        "id": method_id,
                        "class": type_info["name"],
                        "class_kind": type_info["kind"],
                        "method_name": method_info["method_name"],
                        "signature": signature,
                        "source": method_source,
                        "body": body_source,
                        "tags": tags,
                        "annotation_presence": {"Case": has_case, "Tag": has_tag},
                        "_annotation_spans": [
                            {
                                "name": a["name"].split(".")[-1],
                                "start": a["start"] - header_leading_space,
                                "end": a["end"] - header_leading_space,
                            }
                            for a in annotations
                        ],
                        "source_file": type_info["source_file"],
                        "_body_start": pos,
                        "_body_end": body_close + 1,
                    })
                # Skip any complete block (method, initializer, nested type, or
                # anonymous class), then begin the next class member.
                pos = body_close + 1
                segment_start = pos
                paren_depth = bracket_depth = nested_brace_depth = 0
                continue
            else:
                nested_brace_depth += 1
        elif ch == "}":
            if nested_brace_depth > 0:
                nested_brace_depth -= 1
        elif ch == ";" and paren_depth == 0 and bracket_depth == 0 and nested_brace_depth == 0:
            segment_start = pos + 1
        pos += 1

    return methods, warnings


def find_call_names(method_body: str) -> list[str]:
    masked = mask_non_code(method_body)
    names: list[str] = []
    for match in CALL_RE.finditer(masked):
        name = match.group(1)
        if name not in CONTROL_OR_LANGUAGE_WORDS and name not in names:
            names.append(name)
    return names


def source_without_case_tag(method: dict[str, Any]) -> str:
    """Return the complete method source without @Case/@Tag annotations."""
    header = method["signature"]
    spans = [
        (item["start"], item["end"])
        for item in method.get("_annotation_spans", [])
        if item["name"] in {"Case", "Tag"}
    ]
    clean_header = remove_spans(header, spans).strip()
    # The method's source begins with the same header followed by its body.
    # body is stored separately and includes the opening and closing braces.
    return (clean_header + " " + method["body"]).strip()


def split_top_level_commas(text: str) -> list[str]:
    """Split a field declaration on commas outside generic/array/initializer nesting."""
    parts: list[str] = []
    start = 0
    paren = bracket = brace = angle = 0
    masked = mask_non_code(text)
    for i, ch in enumerate(masked):
        if ch == "(": paren += 1
        elif ch == ")": paren = max(0, paren - 1)
        elif ch == "[": bracket += 1
        elif ch == "]": bracket = max(0, bracket - 1)
        elif ch == "{": brace += 1
        elif ch == "}": brace = max(0, brace - 1)
        elif ch == "<": angle += 1
        elif ch == ">" and angle: angle -= 1
        elif ch == "," and paren == bracket == brace == angle == 0:
            parts.append(text[start:i])
            start = i + 1
    parts.append(text[start:])
    return parts


def declared_field_names(segment: str) -> list[str]:
    """Best-effort extraction of field variable names from a class-level declaration."""
    segment = segment.strip()
    if not segment.endswith(";"):
        return []
    segment = segment[:-1]
    masked = mask_non_code(segment)
    if not masked.strip():
        return []
    names: list[str] = []
    for part in split_top_level_commas(segment):
        before_initializer = part.split("=", 1)[0]
        tokens = IDENTIFIER.findall(mask_non_code(before_initializer))
        if tokens:
            candidate = tokens[-1]
            # Avoid treating a bare control/declaration keyword as a field name.
            if candidate not in CONTROL_OR_LANGUAGE_WORDS and candidate not in {"static", "final"}:
                names.append(candidate)
    return names


def extract_relevant_fields(source: str, type_info: dict[str, Any], used_text: str) -> list[str]:
    """Extract class-level field declarations referenced by the target/helper code."""
    used = set(IDENTIFIER.findall(mask_non_code(used_text)))
    if not used:
        return []

    fields: list[str] = []
    pos = type_info["open"] + 1
    member_start = pos
    paren = bracket = 0
    close_limit = type_info["close"]

    while pos < close_limit:
        if source.startswith("//", pos) or source.startswith("/*", pos) or source.startswith('"""', pos):
            pos = skip_quoted_or_comment(source, pos)
            continue
        if source[pos] in ('"', "'"):
            pos = skip_quoted_or_comment(source, pos)
            continue

        ch = source[pos]
        if ch == "(": paren += 1
        elif ch == ")": paren = max(0, paren - 1)
        elif ch == "[": bracket += 1
        elif ch == "]": bracket = max(0, bracket - 1)
        elif ch == "{" and paren == 0 and bracket == 0:
            header = source[member_start:pos]
            body_close = find_matching(source, pos, "{", "}")
            if body_close is None or body_close > close_limit:
                break
            header_masked = mask_non_code(header)
            is_method = identify_method(header, type_info["name"]) is not None
            is_nested_type = bool(TYPE_RE.search(header_masked))
            if is_method or is_nested_type or not header_masked.strip() or header_masked.strip() == "static":
                # A method, nested type, or initializer block is not a field declaration.
                member_start = body_close + 1
            # Otherwise this may be an anonymous/array initializer in a field;
            # keep member_start until its terminating semicolon.
            pos = body_close + 1
            paren = bracket = 0
            continue
        elif ch == ";" and paren == 0 and bracket == 0:
            segment = source[member_start:pos + 1]
            declared_names = declared_field_names(segment)
            if declared_names and any(name in used for name in declared_names):
                cleaned = segment.strip()
                if cleaned and cleaned not in fields:
                    fields.append(cleaned)
            member_start = pos + 1
        pos += 1

    return fields



def rough_token_estimate(text: str) -> int:
    """A rough planning estimate only; actual tokenizer counts will differ."""
    return max(1, (len(text) + 3) // 4)


def main() -> int:
    input_path = INPUT_DIR
    output_dir = OUTPUT_DIR
    if not input_path.exists() or not input_path.is_dir():
        print(f"Input directory does not exist: {input_path}", file=sys.stderr)
        return 1

    java_files = sorted(input_path.rglob("*.java"))
    if not java_files:
        print(f"No .java files found under: {input_path}", file=sys.stderr)
        return 1

    output_dir.mkdir(parents=True, exist_ok=True)
    # Remove legacy combined exports from earlier versions of this script.
    for obsolete_name in ("jev_states.json", "jev_states.txt"):
        obsolete_file = output_dir / obsolete_name
        if obsolete_file.exists():
            obsolete_file.unlink()

    all_warnings: list[str] = []
    method_records: list[dict[str, Any]] = []
    scanned_types = 0

    # Parse all methods first. Only @Case methods will become Jev states.
    for java_file in java_files:
        try:
            source = java_file.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            source = java_file.read_text(encoding="utf-8", errors="replace")

        relative_path = str(java_file.relative_to(input_path))
        masked_file = mask_non_code(source)
        package_match = PACKAGE_RE.search(masked_file)
        package_name = package_match.group(1) if package_match else ""

        for type_info in find_types(source, relative_path):
            scanned_types += 1
            type_info["package"] = package_name
            type_methods, warnings = extract_methods_from_type(source, type_info)
            all_warnings.extend(warnings)

            name_counts: dict[str, int] = {}
            for method in type_methods:
                name_counts[method["method_name"]] = name_counts.get(method["method_name"], 0) + 1
            name_seen: dict[str, int] = {}
            for method in type_methods:
                base_id = ".".join(part for part in (package_name, type_info["name"], method["method_name"]) if part)
                name_seen[method["method_name"]] = name_seen.get(method["method_name"], 0) + 1
                method["id"] = (
                    f"{base_id}#{name_seen[method['method_name']]}"
                    if name_counts[method["method_name"]] > 1 else base_id
                )
                method_records.append({
                    "method": method,
                    "type_info": type_info,
                    "package": package_name,
                    "file_source": source,
                })

    # Name index for helper lookup. @Case methods are excluded from helper context:
    # they are test cases, not helper implementations, under the JPAMB convention.
    helper_index: dict[str, list[dict[str, Any]]] = {}
    for record in method_records:
        method = record["method"]
        if not method["annotation_presence"]["Case"]:
            helper_index.setdefault(method["method_name"], []).append(record)

    def same_declaring_type(left: dict[str, Any], right: dict[str, Any]) -> bool:
        return (
            left["package"] == right["package"]
            and left["type_info"]["name"] == right["type_info"]["name"]
            and left["type_info"]["source_file"] == right["type_info"]["source_file"]
        )

    def record_key(record: dict[str, Any]) -> tuple[str, str, str, str, int]:
        method = record["method"]
        return (record["package"], record["type_info"]["name"], method["signature"], method["source_file"], method["_body_start"])

    MAX_HELPER_DEPTH = 8
    MAX_HELPER_METHODS = 80

    def collect_helpers(root_record: dict[str, Any]) -> list[dict[str, str]]:
        """Collect only no-@Case helper implementations directly/transitively called."""
        queue: list[tuple[dict[str, Any], int]] = [(root_record, 0)]
        visited = {record_key(root_record)}
        added: set[tuple[str, str, str, str, int]] = set()
        helpers: list[dict[str, str]] = []

        while queue and len(added) < MAX_HELPER_METHODS:
            caller, depth = queue.pop(0)
            if depth >= MAX_HELPER_DEPTH:
                continue
            for called_name in find_call_names(caller["method"]["body"]):
                candidates = helper_index.get(called_name, [])
                if not candidates:
                    continue
                local = [candidate for candidate in candidates if same_declaring_type(candidate, caller)]
                # Same-class candidates are most likely to be the invoked helpers.
                # Otherwise include a project-wide match only when the name is unique.
                if local:
                    chosen = local
                elif len(candidates) == 1:
                    chosen = candidates
                else:
                    # Do not attach ambiguous methods from unrelated classes.
                    all_warnings.append(
                        f"Ambiguous helper call '{called_name}' in {caller['method']['id']}; "
                        "no cross-class candidate was attached."
                    )
                    continue

                for candidate_record in chosen:
                    key = record_key(candidate_record)
                    if key == record_key(caller):
                        continue
                    if key not in added:
                        candidate = candidate_record["method"]
                        helper_source = source_without_case_tag(candidate)
                        helper_id = candidate["id"]
                        helpers.append({"id": helper_id, "source": helper_source})
                        added.add(key)
                    if key not in visited and len(added) < MAX_HELPER_METHODS:
                        visited.add(key)
                        queue.append((candidate_record, depth + 1))

        return helpers

    per_method_dir = output_dir / "per_method"
    per_method_dir.mkdir(parents=True, exist_ok=True)
    # Remove stale per-method exports so the directory reflects this run only.
    for old_file in per_method_dir.glob("*.json"):
        old_file.unlink()

    case_count = 0
    tag_count = 0
    attached_helper_ids: set[str] = set()
    for record in method_records:
        method = record["method"]
        if not method["annotation_presence"]["Case"]:
            continue

        helpers = collect_helpers(record)
        target_source = source_without_case_tag(method)
        used_text = "\n".join([target_source] + [helper["source"] for helper in helpers])
        fields = extract_relevant_fields(record["file_source"], record["type_info"], used_text)

        # @Case arguments/expected outcomes are intentionally absent from this state.
        state: dict[str, Any] = {
            "id": method["id"],
            "source": target_source,
        }
        if method["tags"]:
            state["tags"] = method["tags"]
        if helpers:
            state["helpers"] = helpers
            attached_helper_ids.update(helper["id"] for helper in helpers)
        if fields:
            state["fields"] = fields

        individual = {
            "objective": OBJECTIVE,
            "state": state,
        }
        safe_name = re.sub(r"[^A-Za-z0-9_.-]+", "_", state["id"])
        (per_method_dir / f"{safe_name}.json").write_text(
            json.dumps(individual, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
        )
        case_count += 1
        if method["tags"]:
            tag_count += 1

    helper_index_count = sum(
        1 for record in method_records
        if not record["method"]["annotation_presence"]["Case"]
    )
    print(f"Scanned {len(java_files)} Java file(s) and {scanned_types} type(s).")
    print(f"Parsed {len(method_records)} methods for helper resolution.")
    print(f"Exported {case_count} individual @Case state file(s) to: {per_method_dir}")
    print(f"Methods without @Case available for helper resolution: {helper_index_count}")
    print(f"Distinct helper implementations attached: {len(attached_helper_ids)}")
    print(f"States with non-empty @Tag: {tag_count}")
    print("No @Case values, expected outcomes, imports, or combined JSON were exported.")
    if all_warnings:
        print("Warnings:", file=sys.stderr)
        for warning in all_warnings:
            print(f"- {warning}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
