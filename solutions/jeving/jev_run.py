#!/usr/bin/env python3
"""Run Jev once per Java method and save each method's analysis separately.

Jev receives the method implementation and relevant helper/context information,
but never receives @Case values or expected outcomes. The separate selection
script can use Jev's probability distributions to make the final decisions.
"""

import json
import os
from pathlib import Path
from time import perf_counter
from uuid import uuid4

from typesafe_sdk import Choice, Noul, TypeSafeClient


# ---------------------------------------------------------------------------
# Paths and TypeSafe configuration
# ---------------------------------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent
METHODS_DIR = BASE_DIR / "output" / "per_method"
PER_METHOD_RESULTS_DIR = BASE_DIR / "output" / "jev_results" / "per_method"

API_KEY = os.getenv("TYPESAFE_API_KEY")
MODEL = os.getenv("TYPESAFE_DEFAULT_MODEL")  # Optional; None uses the SDK default.


# ---------------------------------------------------------------------------
# Analyzer registry: the single source of truth for analyzer descriptions
# ---------------------------------------------------------------------------

ANALYZERS = [
    {
        "name": "static_sign",
        "supports": ["int", "boolean"],
        "description": (
            "Tracks integer signs (negative, zero, positive) across all execution paths. "
            "Supported parameters: int, boolean, or no parameters. "
            "Best for short, straight-line integer math, sign comparisons (< 0, == 0, > 0), "
            "and simple division-by-zero checks. "
            "Do NOT use for String/array parameters, loops, static calls, recursion, or type casts."
        ),
    },
    {
        "name": "static_interval",
        "supports": ["int", "boolean"],
        "description": (
            "Tracks minimum and maximum integer bounds across all execution paths. "
            "Supported parameters: int, boolean, or no parameters. "
            "Best for integer arithmetic with if/else branches, range checks (e.g., x > 5 && x < 10), "
            "guarded division (if x != 0), and internally created array bounds/length checks. "
            "Do NOT use for String or array parameters (int[], char[]), loops, static calls, "
            "recursion, or type casts."
        ),
    },
    {
        "name": "static_string",
        "supports": ["String", "boolean"],
        "description": (
            "Tracks possible String values and equality comparisons across all execution paths. "
            "Supported parameters: String, boolean, or no parameters. "
            "Best when the method takes String parameters and uses .equals() or literal comparisons "
            "to control branches or assertions. "
            "Do NOT use for int or array parameters, loops, static calls, recursion, or type casts."
        ),
    },
    {
        "name": "dynamic_random",
        "supports": ["int", "boolean", "int[]", "char[]", "String"],
        "description": (
            "Executes the method with randomly generated concrete inputs, including boundary integers "
            "such as 0, 1, -1, INT_MIN, INT_MAX, as well as random strings and arrays. "
            "Supports int, boolean, int[], char[], and String parameters. "
            "Best when the method takes array parameters, mixes String with int parameters, has more "
            "than two parameters, or combines Strings/arrays with loops, static calls, recursion, or casts."
        ),
    },
    {
        "name": "dynamic_small",
        "supports": ["int", "boolean"],
        "description": (
            "Systematically tests small concrete inputs (e.g., 0, 1, -1, 2, -2, 3, -3, true, false) "
            "in increasing order of magnitude. "
            "Supports int, boolean, or no parameters; ideally at most two parameters. "
            "Best for methods with loops, static calls, recursion, or casts where bugs or '*' timeouts "
            "are triggered by small values. "
            "Do NOT use for String or array parameters, or more than two parameters."
        ),
    },
    {
        "name": "dynamic_mutation",
        "supports": ["int", "boolean"],
        "description": (
            "Starts from seed inputs (all zeros/false plus a random seed) and mutates inputs that "
            "discover new behaviours (+1, -1, negate, 0, *2, flip boolean). "
            "Supports int and boolean parameters. "
            "Best when the method needs guided exploration to reach deeper branches, larger integers, "
            "or specific boundary values that small exhaustive values (-3..3) miss. "
            "Do NOT use for String or array parameters, or methods with no parameters."
        ),
    },
]


# ---------------------------------------------------------------------------
# Shared JPAMB context
# ---------------------------------------------------------------------------

JPAMB_CONTEXT = {
    "runtime_outcomes": [
        {"name": "ok", "description": "Returns normally."},
        {"name": "divide by zero", "description": "Division or remainder by 0."},
        {"name": "assertion error", "description": "An assert statement fails."},
        {"name": "out of bounds", "description": "Invalid array index access."},
        {"name": "null pointer", "description": "Null reference dereference."},
        {"name": "*", "description": "Infinite loop or timeout."},
    ],
    "analyzer_differences": {
        "static": {
            "description": "Static analyzers inspect all paths without concrete inputs.",
            "strengths": ["Can prove outcomes impossible."],
            "limitations": [
                "Fail on static method calls.",
                "Fail on recursion.",
                "Fail on type casts.",
            ],
        },
        "dynamic": {
            "description": "Dynamic analyzers execute methods using concrete inputs.",
            "strengths": [
                "Can trigger runtime crashes.",
                "Can detect infinite loops or timeouts.",
                "Can handle static method calls.",
                "Can handle recursion.",
                "Can handle type casts.",
            ],
        },
    },
    "pairing_strategy": [
        {
            "analyzers": ["static", "dynamic"],
            "use_when": (
                "Use a complementary analyzer from the opposite analysis family when useful: "
                "pair static analysis with dynamic execution, or dynamic execution with static analysis. "
                "The Python selection script determines the concrete compatible analyzer."
            ),
        },
    ],
    "pairing_restrictions": [
        "Do not pair two analyzers that perform the same function.",
        "Do not select an incompatible secondary analyzer.",
    ],
    "parameter_compatibility": {
        "priority": "highest",
        "rule": "Never select an analyzer if any method parameter is outside its supported types.",
    },
}


# ---------------------------------------------------------------------------
# Questions Jev answers for each method
# ---------------------------------------------------------------------------

QUESTIONS = {
    "method_understanding": Choice(
        instructions=(
            "Look at the method's parameter types, source operations, helper calls, "
            "and control flow. Pick the single category that best describes the "
            "method's main analysis-relevant behaviour."
        ),
        criteria={
            "calls_recursion_or_cast": (
                "The method invokes another helper/static method, calls itself recursively, "
                "or performs primitive type casts (e.g., int to char/short/byte)."
            ),
            "string_logic": (
                "The method takes String parameters or uses String operations such as .equals() "
                "or literal comparisons."
            ),
            "array_logic": (
                "The method takes array parameters (such as int[] or char[]) or creates/indexes arrays."
            ),
            "loop_logic": (
                "The method contains for/while loops or repeated iteration where non-termination "
                "('*') or loop behaviour is a major concern."
            ),
            "numeric_or_branch_logic": (
                "The method performs integer math, division, assertions, or if/else branching "
                "without loops, helper calls, recursion, or casts."
            ),
        },
    ),
    "primary_analyzer": Choice(
        instructions=(
            "Select the SINGLE best primary analyzer for this method. "
            "First check compatibility with every method parameter type. "
            "Then match the implementation, operations, helper calls, and control flow "
            "to the analyzer descriptions. Do not choose an analyzer that cannot support "
            "all parameter types."
        ),
        criteria={analyzer["name"]: analyzer["description"] for analyzer in ANALYZERS},
    ),
    "needs_complementary_analysis": Noul(
        instructions=(
            "Does this method materially benefit from a second analyzer from the opposite "
            "analysis family (static versus dynamic), in addition to its primary analyzer? "
            "Answer yes only when the second technique is likely to reveal useful information "
            "that the primary technique cannot provide. The Python selection script will choose "
            "the concrete compatible analyzer; do not choose or name an analyzer here."
        ),
        criteria={
            "true": (
                "Yes. A complementary analyzer from the opposite family would provide useful "
                "additional evidence, such as static path reasoning alongside concrete execution, "
                "or concrete execution alongside static path reasoning."
            ),
            "false": (
                "No. The primary analyzer is sufficient, or no compatible analyzer from the "
                "opposite family would add meaningful value."
            ),
        },
    ),
    "use_dictionary": Noul(
        instructions=(
            "Are there specific constants or literals in the method or its relevant helpers "
            "that should be extracted as targeted fuzzer seeds?"
        ),
        criteria={
            "true": (
                "A specific integer, char, or String literal directly controls a branch, "
                "comparison, or assertion (e.g., x == 42 or s.equals(\"hello\"))."
            ),
            "false": "No specific constant or literal controls the branching behaviour.",
        },
    ),
}


# ---------------------------------------------------------------------------
# Answer serialization
# ---------------------------------------------------------------------------

def serialize_answer(answer):
    """Convert a TypeSafe answer to JSON-friendly values (probabilities as percentages)."""
    if hasattr(answer, "choice"):
        return {
            "type": "choice",
            "selected": answer.choice,
            "probabilities_percent": {
                option: round(float(probability) * 100, 2)
                for option, probability in answer.probabilities.items()
            },
        }

    if hasattr(answer, "noul"):
        return {
            "type": "noul",
            "yes_probability_percent": round(float(answer.noul) * 100, 2),
        }

    # Keep unexpected answer types visible rather than silently discarding them.
    return {"type": "unknown", "value": str(answer)}


def build_jev_state(data):
    """Build Jev input while explicitly excluding all @Case information."""
    method = dict(data["state"])

    # Defensive filtering: older prepared JSON files may still contain case data.
    for key in (
        "cases",
        "case_annotations",
        "annotation_presence",
        "annotations",
    ):
        method.pop(key, None)

    return {
        "objective": (
            "Assess which analysis techniques are suitable for this Java method. "
            "Base the assessment on the source implementation, parameter types, "
            "operations, control flow, and relevant helper/field context. "
            "Do not infer behaviour from the method name alone."
        ),
        "method": method,
        "analyzers": ANALYZERS,
        "jpamb_context": JPAMB_CONTEXT,
    }


def main():
    if not API_KEY:
        raise SystemExit("Set the TYPESAFE_API_KEY environment variable first.")

    if not METHODS_DIR.exists():
        raise SystemExit(f"Methods directory not found: {METHODS_DIR}")

    method_files = sorted(METHODS_DIR.glob("*.json"))
    if not method_files:
        raise SystemExit(f"No method JSON files found in: {METHODS_DIR}")

    PER_METHOD_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    run_id = uuid4().hex

    with TypeSafeClient(api_key=API_KEY, model=MODEL) as client:
        for method_file in method_files:
            data = json.loads(method_file.read_text(encoding="utf-8"))
            method_id = data["state"]["id"]
            print(f"\nAnalysing: {method_id}")

            start = perf_counter()
            state = build_jev_state(data)
            response = client.system_one(state=state, questions=QUESTIONS)
            answers = {
                question: serialize_answer(answer)
                for question, answer in response.answers.items()
            }
            jev_seconds = perf_counter() - start

            result = {
                "method_id": method_id,
                "source_file": method_file.name,
                "answers": answers,
                "selection_timing": {"run_id": run_id, "jev_seconds": jev_seconds},
            }

            result_file = PER_METHOD_RESULTS_DIR / f"{method_file.stem}.json"
            result_file.write_text(
                json.dumps(result, indent=2, ensure_ascii=False) + "\n",
                encoding="utf-8",
            )

            print(f"Saved: {result_file}")

    print(f"\nFinished. Per-method results are in: {PER_METHOD_RESULTS_DIR}")


if __name__ == "__main__":
    main()
