from pathlib import Path
import json
import os
from typesafe_sdk import Choice, TypeSafeClient

METHODS_DIR = Path(__file__).parent / "output" / "per_method"

# Configure TypeSafe access.
API_KEY = os.getenv("TYPESAFE_API_KEY")
MODEL = os.getenv("TYPESAFE_DEFAULT_MODEL")  # Optional; None uses the SDK default.

# Add the Jev questions here.
QUESTIONS = {
    # "question_id": Choice(
    #     instructions="TO BE ADDED",
    #     criteria={
    #         "option_1": "TO BE ADDED",
    #         "option_2": "TO BE ADDED",
    #     },
    # ),
}

if not API_KEY:
    raise SystemExit("Set the TYPESAFE_API_KEY environment variable first.")

if not QUESTIONS:
    raise SystemExit("Add at least one question to QUESTIONS before running the analysis.")

with TypeSafeClient(api_key=API_KEY, model=MODEL) as client:
    for method_file in sorted(METHODS_DIR.glob("*.json")):
        data = json.loads(method_file.read_text(encoding="utf-8"))

        # One Java @Case method becomes one Jev state.
        state = {
            "objective": data["objective"],
            "case_semantics": data["case_semantics"],
            "method": data["state"],
        }

        method_id = data["state"]["id"]
        print(f"\nAnalysing: {method_id}") 

        response = client.system_one(state=state, questions=QUESTIONS)

        for question, answer in response.answers.items():
            print(f"\n{question}: {answer.choice}")
            for option, probability in answer.probabilities.items():
                print(f"  {option}: {probability:.1%}")

        input("\nPress Enter for the next method (Ctrl+C to stop)...")
