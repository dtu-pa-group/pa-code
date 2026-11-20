from pathlib import Path
import json
import os
from typesafe_sdk import Choice, Noul, TypeSafeClient

METHODS_DIR = Path(__file__).parent / "output" / "per_method"

# TypeSafe configuration.
API_KEY = os.getenv("TYPESAFE_API_KEY")
MODEL = os.getenv("TYPESAFE_DEFAULT_MODEL")  # Optional; None uses the SDK default.

# Questions Jev answers for each Java method.
QUESTIONS = {
    "primary_analyzer": Choice(
        instructions=(
            "Select the single best analyzer configuration for this Java method "
            "based on its input types, helpers, and structural features."
        ),
        criteria={
            "static_sign": (
                "Use for simple integer math, division by zero, or sign comparisons. "
                "Fails if the method uses strings."
            ),
            "static_interval": (
                "Use for complex integer math requiring precise bounds (e.g., array indices, loops). "
                "Fails if the method uses strings."
            ),
            "static_string": (
                "Use if the method takes a String and relies on .equals() or string comparisons. "
                "Requires --abstractions string."
            ),
            "syntactic_treesitter": (
                "Use for a fast check to see if an 'assert' statement exists in the source code "
                "without running any math."
            ),
            "syntactic_bytecode": (
                "Use as a fast fallback to check for AssertionError in the compiled bytecode."
            ),
            "dynamic_random": (
                "Use if the method takes arrays, strings, or complex types and requires "
                "concrete fuzzing to trigger a crash."
            ),
            "dynamic_small": (
                "Use ONLY if the method takes integers or booleans and you want to "
                "exhaustively test small values."
            ),
            "dynamic_mutation": (
                "Use ONLY if the method takes integers or booleans and you want to "
                "mutate a seed input to find edge cases."
            ),
        },
    ),
    "use_dictionary": Noul(
        instructions=(
            "Are there specific string or character literals, or meaningful constants, "
            "that should be used as targeted fuzzer seeds?"
        ),
        criteria={
            "true": (
                "A relevant literal influences a condition, assertion or program behavior "
                "(e.g., checking if a string equals 'hello')."
            ),
            "false": (
                "No relevant literal was identified, or the method does not use strings "
                "for control flow."
            ),
        },
    ),
    "run_secondary_static": Noul(
        instructions=(
            "Should we also run static_sign in the background to provide complementary "
            "'Must' analysis alongside a dynamic fuzzer?"
        ),
        criteria={
            "true": (
                "The method contains integer math or division, so static analysis can "
                "provide complementary proof alongside the fuzzer."
            ),
            "false": (
                "The method is purely string/array based and static sign analysis would add no value."
            ),
        },
    ),
}

# Analyzer catalogue supplied to Jev for every method.
ANALYZERS = [
    {
        "name": "static_sign",
        "supports": ["int", "boolean"],
    },
    {
        "name": "static_interval",
        "supports": ["int", "boolean"],
    },
    {
        "name": "static_string",
        "supports": ["String", "boolean"],
    },
    {
        "name": "syntactic_treesitter",
        "supports": ["assert", "ast"],
    },
    {
        "name": "syntactic_bytecode",
        "supports": ["assert", "bytecode"],
    },
    {
        "name": "dynamic_random",
        "supports": ["int", "boolean", "int[]", "char[]", "String"],
    },
    {
        "name": "dynamic_small",
        "supports": ["int", "boolean"],
    },
    {
        "name": "dynamic_mutation",
        "supports": ["int", "boolean"],
    },
]

if not API_KEY:
    raise SystemExit("Set the TYPESAFE_API_KEY environment variable first.")

if not METHODS_DIR.exists():
    raise SystemExit(f"Methods directory not found: {METHODS_DIR}")

method_files = sorted(METHODS_DIR.glob("*.json"))
if not method_files:
    raise SystemExit(f"No method JSON files found in: {METHODS_DIR}")

with TypeSafeClient(api_key=API_KEY, model=MODEL) as client:
    for method_file in method_files:
        data = json.loads(method_file.read_text(encoding="utf-8"))

        # One Java @Case method becomes one Jev state.
        state = {
            "objective": data["objective"],
            "case_semantics": data["case_semantics"],
            "method": data["state"],
            "analyzers": ANALYZERS,
        }

        method_id = data["state"]["id"]
        print(f"\nAnalysing: {method_id}")

        response = client.system_one(state=state, questions=QUESTIONS)

        for question, answer in response.answers.items():
            print(f"\n{question}:")

            if hasattr(answer, "choice"):
                print(f"  Selected: {answer.choice}")
                for option, probability in answer.probabilities.items():
                    print(f"  {option}: {probability:.1%}")
            elif hasattr(answer, "noul"):
                print(f"  Yes probability: {answer.noul:.1%}")
            else:
                print(f"  {answer}")

        input("\nPress Enter for the next method (Ctrl+C to stop)...")
