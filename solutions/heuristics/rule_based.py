#!/usr/bin/env python3
"""
Rule-Based Heuristic Selector for JPAMB.

Extracts structural and control-flow features from a Java method's
decompiled JVM bytecode and applies rules R1a–R9b to choose a tailored mix of
static and dynamic analyses for `engine.py` (including coverage-guided
fuzzing for loops and complex branches).

Records per-run analyzer selections and predictions under:
    solutions/heuristics/output/output_1.json, output_2.json, ...

Python API:
    analyses = select_for_method(method_id)
    predictions = engine.run(analyses, method_id)

CLI / JPAMB usage:
    uv run jpamb analyse -- python solutions/heuristics/rule_based.py
"""
from __future__ import annotations

from dataclasses import dataclass, field
import fcntl
import json
from pathlib import Path
import re
import sys
from typing import Any

# Points to repo root (pa-code/) from solutions/heuristics/rule_based.py
DEFAULT_REPO_ROOT = Path(__file__).resolve().parents[2]
if str(DEFAULT_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(DEFAULT_REPO_ROOT))

OUTPUT_DIR = Path(__file__).resolve().parent / "output"


# ---------------------------------------------------------------------------
# Per-Run JSON Output Helpers (output_1.json, output_2.json, ...)
# ---------------------------------------------------------------------------

def _existing_output_numbers() -> list[int]:
    if not OUTPUT_DIR.exists():
        return []
    nums = []
    for p in OUTPUT_DIR.glob("output_*.json"):
        m = re.fullmatch(r"output_(\d+)\.json", p.name)
        if m:
            nums.append(int(m.group(1)))
    return sorted(nums)


def _start_new_output_file() -> Path:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    nums = _existing_output_numbers()
    next_num = (nums[-1] + 1) if nums else 1
    out_path = OUTPUT_DIR / f"output_{next_num}.json"
    out_path.write_text("{}", encoding="utf-8")
    return out_path


def _record_result(method_id: str, analyses: list[str], predictions: dict[str, str]) -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    lock_path = OUTPUT_DIR / ".output.lock"
    with lock_path.open("w", encoding="utf-8") as lock_file:
        fcntl.flock(lock_file, fcntl.LOCK_EX)
        try:
            nums = _existing_output_numbers()
            out_path = OUTPUT_DIR / f"output_{nums[-1]}.json" if nums else _start_new_output_file()
            try:
                data = json.loads(out_path.read_text(encoding="utf-8"))
            except (json.JSONDecodeError, FileNotFoundError):
                data = {}
            data[method_id] = {
                "analyses": analyses,
                "predictions": predictions,
            }
            out_path.write_text(json.dumps(data, indent=2), encoding="utf-8")
        finally:
            fcntl.flock(lock_file, fcntl.LOCK_UN)


# ---------------------------------------------------------------------------
# Data Structure
# ---------------------------------------------------------------------------

@dataclass
class MethodFeatures:
    method_id: str
    class_name: str
    method_name: str
    descriptor: str
    bytecode_length: int = 0
    param_count: int = 0
    only_int_bool_params: bool = True
    has_int_param: bool = False
    has_string_param: bool = False
    has_string_ops: bool = False
    has_array_param: bool = False
    has_array_ops: bool = False
    has_int_arithmetic: bool = False
    has_division: bool = False
    has_assertion: bool = False
    has_null_ops: bool = False
    has_cast: bool = False
    has_loops: bool = False
    loop_count: int = 0
    branch_count: int = 0
    has_invokestatic: bool = False
    is_recursive: bool = False
    opcodes_seen: list[str] = field(default_factory=list)


# ---------------------------------------------------------------------------
# Method ID Parsing & Decompiled Bytecode Loader
# ---------------------------------------------------------------------------

def parse_method_id(method_id: str) -> tuple[str, str, str]:
    if ":" in method_id:
        qual_name, descriptor = method_id.split(":", 1)
    else:
        qual_name, descriptor = method_id, ""
    parts = qual_name.rsplit(".", 1)
    if len(parts) != 2:
        raise ValueError(f"Invalid JPAMB method ID: {method_id}")
    return parts[0], parts[1], descriptor


def _parse_jvm_params(param_str: str) -> list[str]:
    params: list[str] = []
    i = 0
    while i < len(param_str):
        start = i
        while i < len(param_str) and param_str[i] == "[":
            i += 1
        if i < len(param_str) and param_str[i] == "L":
            end = param_str.find(";", i)
            i = (end + 1) if end != -1 else len(param_str)
        else:
            i += 1
        params.append(param_str[start:i])
    return params


def load_decompiled_method(
    class_name: str,
    method_name: str,
    descriptor: str,
    repo_root: Path,
) -> dict[str, Any] | None:
    rel_path = Path(*class_name.split(".")).with_suffix(".json")
    json_path = repo_root / "target" / "decompiled" / rel_path
    if not json_path.exists():
        return None

    data = json.loads(json_path.read_text(encoding="utf-8"))
    expected_arity = (
        len(_parse_jvm_params(descriptor[1 : descriptor.find(")")]))
        if "(" in descriptor and ")" in descriptor
        else None
    )
    for method in data.get("methods", []):
        if method.get("name") != method_name:
            continue
        if expected_arity is None or len(method.get("params", [])) == expected_arity:
            return method
    return None


# ---------------------------------------------------------------------------
# Bytecode Feature Extractor
# ---------------------------------------------------------------------------

def extract_features(method_id: str, repo_root: Path = DEFAULT_REPO_ROOT) -> MethodFeatures:
    class_name, method_name, descriptor = parse_method_id(method_id)
    feats = MethodFeatures(
        method_id=method_id,
        class_name=class_name,
        method_name=method_name,
        descriptor=descriptor,
    )

    param_sig = descriptor[1 : descriptor.find(")")] if "(" in descriptor and ")" in descriptor else ""
    params = _parse_jvm_params(param_sig)
    feats.param_count = len(params)
    feats.has_int_param = any(p == "I" for p in params)
    feats.has_string_param = any(p == "Ljava/lang/String;" for p in params)
    feats.has_array_param = any(p.startswith("[") for p in params)
    feats.only_int_bool_params = all(p in {"I", "Z"} for p in params)

    method_json = load_decompiled_method(class_name, method_name, descriptor, repo_root)
    if not method_json:
        return feats

    bytecode = (method_json.get("code") or {}).get("bytecode") or []
    feats.bytecode_length = len(bytecode)

    opcodes: set[str] = set()
    back_edges = 0
    norm_class = class_name.replace(".", "/")

    for idx, instr in enumerate(bytecode):
        opr = str(instr.get("opr", "")).lower()
        offset = instr.get("offset", idx)
        opcodes.add(opr)

        if opr == "push":
            val = instr.get("value")
            if isinstance(val, dict) and val.get("type") == "string":
                feats.has_string_ops = True

        if opr == "invoke":
            access = str(instr.get("access", "")).lower()
            target_method = instr.get("method") or {}
            ref_name = str((target_method.get("ref") or {}).get("name", ""))
            m_name = str(target_method.get("name", ""))

            if "java/lang/String" in ref_name:
                feats.has_string_ops = True
            if "AssertionError" in ref_name:
                feats.has_assertion = True
            if access == "static" and ref_name and not ref_name.startswith(("java/", "javax/", "sun/", "jdk/")):
                feats.has_invokestatic = True
                if ref_name == norm_class and m_name == method_name:
                    feats.is_recursive = True

        if opr in {"newarray", "anewarray", "multianewarray", "arraylength", "array_load", "array_store"}:
            feats.has_array_ops = True

        if opr == "cast":
            feats.has_cast = True

        if opr in {"binary", "incr", "negate"}:
            feats.has_int_arithmetic = True
            operant = str(instr.get("operant", "")).lower()
            if operant in {"div", "rem"}:
                feats.has_division = True

        if opr == "new" and "AssertionError" in str(instr.get("class", "")):
            feats.has_assertion = True
        if opr == "get" and "$assertionsDisabled" in str((instr.get("field") or {}).get("name", "")):
            feats.has_assertion = True
        if opr in {"ifz", "if"} and str(instr.get("condition", "")).lower() in {"is", "isnot"}:
            feats.has_null_ops = True

        if opr in {"if", "ifz", "goto", "goto_w"}:
            feats.branch_count += 1
            target = instr.get("target")
            if isinstance(target, int) and target <= offset:
                feats.has_loops = True
                back_edges += 1

    feats.loop_count = back_edges
    feats.opcodes_seen = sorted(opcodes)
    return feats


# ---------------------------------------------------------------------------
# Rule-Based Selector (R1a–R9b) -> List of engine.py Analyzer Names
# ---------------------------------------------------------------------------

def _best_dynamic(f: MethodFeatures) -> list[str]:
    """Pick the best dynamic analyzer(s) compatible with the method's parameters."""
    if f.only_int_bool_params and f.param_count <= 2:
        return ["dynamic_small", "dynamic_mutation"]
    if f.only_int_bool_params:
        return ["dynamic_mutation"]
    return ["dynamic_random"]


def select_analyzers(f: MethodFeatures) -> list[str]:
    """Return an ordered list of analyzer names registered in engine.py.

    Static rules are paired with a compatible dynamic analyzer so engine.combine()
    can supply both 'no' (from static) and 'yes' (from dynamic) predictions.
    """
    # R1a / R1b: Static calls, recursion, or casts (unsupported by static.py)
    if f.has_invokestatic or f.is_recursive or f.has_cast:
        return _best_dynamic(f)

    # R2: Strings only (no ints or arrays)
    if (f.has_string_param or f.has_string_ops) and not (
        f.has_int_param or f.has_int_arithmetic or f.has_array_param or f.has_array_ops
    ):
        return ["static_string", "dynamic_random"]

    # R3: Strings + numeric/array logic
    if f.has_string_param or f.has_string_ops:
        return ["static_interval", "static_string", "dynamic_random"]

    # R4: Arrays
    if f.has_array_param or f.has_array_ops:
        return ["static_interval", *_best_dynamic(f)]

    # R5a / R5b: Loops (dynamic fuzzer rule)
    if f.has_loops:
        return ["dynamic_coverage"]

    # R6: Branch-guarded division
    if f.has_division and f.branch_count > 0:
        return ["static_sign", "static_interval", *_best_dynamic(f)]

    # R7: Numeric arithmetic or branches (dynamic fuzzer rule for deeper branching)
    if f.branch_count >= 3:
        return ["static_interval", "dynamic_coverage"]
    if f.branch_count > 0 or f.has_int_arithmetic:
        return ["static_interval", *_best_dynamic(f)]

    # R8: Short straight-line method
    if f.bytecode_length <= 25:
        return ["static_sign", *_best_dynamic(f)]

    # R9a / R9b: Fallbacks
    return _best_dynamic(f)


def select_for_method(method_id: str, repo_root: Path = DEFAULT_REPO_ROOT) -> list[str]:
    """Extract bytecode features for method_id and return the list of analyzers to run."""
    features = extract_features(method_id, repo_root)
    return select_analyzers(features)


# ---------------------------------------------------------------------------
# Entry Point (Hands off execution & JPAMB protocol to engine.py)
# ---------------------------------------------------------------------------

def main() -> int:
    import engine
    import jpamb

    if len(sys.argv) == 2 and sys.argv[1] == "info":
        _start_new_output_file()
        jpamb.printinfo(
            "rule-based-heuristic",
            "1.0",
            "Los Pollos Hermanos",
            ["heuristic", "rule-based", "hybrid", "python"],
            True,
        )
        return 0

    if len(sys.argv) != 2:
        print("Usage: python rule_based.py <method_id | info>", file=sys.stderr)
        return 2

    method_id = sys.argv[1]
    analyses = select_for_method(method_id, engine.ROOT)
    predictions = engine.run(analyses, method_id)
    _record_result(method_id, analyses, predictions)
    engine.emit(predictions)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())