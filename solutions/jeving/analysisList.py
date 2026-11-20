from pathlib import Path
import json

# Input: individual Jev result files.
RESULTS_DIR = Path(__file__).parent / "output" / "jev_results" / "per_method"

# Output: one combined file containing the selection for every method.
OUTPUT_FILE = Path(__file__).parent / "output" / "analysis_selections.json"

# Selection thresholds (percentages are on a 0-100 scale).
SINGLE_ANALYZER_MIN = 60.0
SINGLE_ANALYZER_LEAD = 15.0
COMBINATION_MIN = 20.0
NOUL_YES_THRESHOLD = 50.0

# Analyzer groups used to identify whether a static analyzer is already selected.
STATIC_ANALYZERS = {"static_sign", "static_interval", "static_string"}
DYNAMIC_ANALYZERS = {
    "dynamic_random",
    "dynamic_small",
    "dynamic_mutation",
}


def select_analyzers(probabilities):
    """Select one analyzer, a combination, or flag the method for review."""
    if not probabilities:
        return [], "manual_review", "No primary analyzer probabilities were found."

    ranked = sorted(
        probabilities.items(),
        key=lambda item: item[1],
        reverse=True,
    )

    highest_name, highest_score = ranked[0]
    second_score = ranked[1][1] if len(ranked) > 1 else 0.0

    # A clear winner: high score and sufficient lead over second place.
    if (
        highest_score >= SINGLE_ANALYZER_MIN
        and highest_score - second_score >= SINGLE_ANALYZER_LEAD
    ):
        return (
            [highest_name],
            "single_analyzer",
            "The highest analyzer score is at least 60% and leads the second-highest by at least 15 percentage points.",
        )

    # Otherwise, select all analyzers reaching the combination threshold.
    selected = [
        name for name, score in ranked
        if score >= COMBINATION_MIN
    ]

    if selected:
        return (
            selected,
            "analyzer_combination",
            "No clear single winner met the selection rule; all analyzers scoring at least 20% were selected.",
        )

    return (
        [],
        "manual_review",
        "No analyzer reached the 20% combination threshold.",
    )


def get_yes_probability(answers, question_name):
    """Read a Noul yes probability, returning None if it is unavailable."""
    answer = answers.get(question_name, {})
    value = answer.get("yes_probability_percent")
    return None if value is None else float(value)


def process_result(result):
    answers = result.get("answers", {})

    primary = answers.get("primary_analyzer", {})
    probabilities = {
        name: float(score)
        for name, score in primary.get("probabilities_percent", {}).items()
    }

    selected, selection_type, selection_reason = select_analyzers(probabilities)
    primary_selected = list(selected)

    # Dictionary seeds: enable at 50% Yes or higher.
    dictionary_probability = get_yes_probability(answers, "use_dictionary")
    use_dictionary = (
        dictionary_probability is not None
        and dictionary_probability >= NOUL_YES_THRESHOLD
    )

    # Secondary static analysis complements dynamic analysis only when no
    # static analyzer is already part of the primary selection.
    secondary_probability = get_yes_probability(answers, "run_secondary_static")
    dynamic_selected = any(name in DYNAMIC_ANALYZERS for name in selected)
    static_already_selected = any(name in STATIC_ANALYZERS for name in selected)

    add_secondary_static = (
        secondary_probability is not None
        and secondary_probability >= NOUL_YES_THRESHOLD
        and dynamic_selected
        and not static_already_selected
    )

    if add_secondary_static:
        selected.append("static_sign")

    return {
        "method_id": result.get("method_id"),
        "source_file": result.get("source_file"),
        "selection_status": selection_type,
        "selected_analyzers": selected,
        "primary_analyzers": primary_selected,
        "secondary_static_added": add_secondary_static,
        "use_dictionary": use_dictionary,
        "scores": {
            "primary_analyzer_percent": probabilities,
            "use_dictionary_yes_percent": dictionary_probability,
            "run_secondary_static_yes_percent": secondary_probability,
        },
        "selection_reason": {
            "primary": selection_reason,
            "dictionary": (
                f"Enabled because Yes probability is at least {NOUL_YES_THRESHOLD:.0f}%."
                if use_dictionary
                else f"Not enabled because Yes probability is below {NOUL_YES_THRESHOLD:.0f}% or unavailable."
            ),
            "secondary_static": (
                "Added static_sign because the Yes probability is at least 50%, a dynamic analyzer was selected, and no static analyzer was already selected."
                if add_secondary_static
                else "Not added: the probability threshold was not met, no dynamic analyzer was selected, or a static analyzer was already selected."
            ),
        },
    }


def main():
    if not RESULTS_DIR.exists():
        raise SystemExit(f"Results directory not found: {RESULTS_DIR}")

    result_files = sorted(RESULTS_DIR.glob("*.json"))
    if not result_files:
        raise SystemExit(f"No result JSON files found in: {RESULTS_DIR}")

    selections = []
    errors = []

    for result_file in result_files:
        try:
            result = json.loads(result_file.read_text(encoding="utf-8"))
            selections.append(process_result(result))
        except (json.JSONDecodeError, OSError, TypeError, ValueError, AttributeError) as exc:
            errors.append({"file": result_file.name, "error": str(exc)})

    output = {
        "selection_rules": {
            "single_analyzer": {
                "minimum_percent": SINGLE_ANALYZER_MIN,
                "minimum_lead_over_second_percent": SINGLE_ANALYZER_LEAD,
            },
            "combination_minimum_percent": COMBINATION_MIN,
            "noul_yes_threshold_percent": NOUL_YES_THRESHOLD,
            "secondary_static_rule": (
                "Add static_sign only when run_secondary_static is at least 50%, "
                "at least one dynamic analyzer is selected, and no static analyzer "
                "is already selected."
            ),
        },
        "methods_processed": len(selections),
        "methods": selections,
    }

    if errors:
        output["errors"] = errors

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_FILE.write_text(
        json.dumps(output, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )

    print(f"Processed {len(selections)} method result(s).")
    if errors:
        print(f"Could not process {len(errors)} file(s); see the errors field in the output.")
    print(f"Combined selections saved to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
