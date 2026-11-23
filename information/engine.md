# Analysis engine

`engine.py` composes techniques through adapters, without modifying their
implementations or Jev. It analyzes one method at a time. JPAMB runs that adapter
for each benchmark method and compares the final predictions against ground truth.

## Setup and CLI

Use the existing built checkout and Python 3.13+ environment:

```bash
cd /home/sweet/project_PA/pa-code
source .venv/bin/activate
# If dependencies are not installed yet:
uv pip install -e . -e solutions/static -e solutions/dynamic pytest hypothesis

python engine.py --analyses static_sign,static_string,dynamic_small info
python engine.py --analyses static_sign,static_string,dynamic_small \
  'jpamb.cases.Simple.divideByN:(I)I'
```

The method command prints exactly six `outcome;result` lines, including `*`.
Results are `yes`, `no`, or `maybe`. Diagnostics and contradictions go to stderr.
`info` uses JPAMB's metadata format. Run from the checkout containing `target/`;
the method command reads the existing decompiled benchmark files.

Available names: `static_sign`, `static_string`, `static_int` (interval analysis),
`dynamic_random`, `dynamic_small`, `dynamic_mutation`. `static_interval` is an
engine-side alias for `static_int`. Duplicates run only once; unknown names fail
before any analysis runs. An empty Python selection returns all `maybe`.

## JPAMB suite scoring

```bash
# Quick subset, one iteration:
jpamb analyse --filter Simple --iterations 1 -- \
  python engine.py --analyses static_sign,static_string,dynamic_small

# Entire suite, default three iterations:
jpamb analyse -- python engine.py --analyses static_sign,static_string,dynamic_small

# Save a standard full-suite report (three iterations, no filter):
mkdir -p reports
jpamb analyse --report reports/engine.sexp -- \
  python engine.py --analyses static_sign,static_string,dynamic_small
```

JPAMB appends `info` or the method identifier to the command. The engine returns
the combined dictionary through the protocol, and JPAMB performs ground-truth
comparison, category calibration, method scoring, and aggregation. `yes`, `no`,
and `maybe` are categories: the current scorer learns their wagers across the
evaluated suite; these labels are not automatically fixed numerical probabilities.
`run()` itself does not read ground truth or compute a standalone numeric score.
One-iteration filtered checks are useful diagnostics, not valid saved reports.

Existing JPAMB options remain available, including the explicitly experimental
`--true` ground-truth correction documented in the main README. That option goes
before `--` and cannot be combined with `--report`. All selected techniques have
cumulative execution cost; JPAMB's outer process timeout still applies.

## Python interface for Jev

Your teammate can supply the selected names and current method identifier:

```python
from engine import run

selected = ["static_sign", "static_string", "dynamic_small"]
behaviors = run(selected, "jpamb.cases.Simple.divideByN:(I)I")
# behaviors is dict[str, str], with every JPAMB query present.
```

The method may also be a parsed `jvm.AbsMethodID`. To reuse bytecode across calls:

```python
import jpamb
from engine import run

suite, eff = jpamb.setup()
bytecode = jpamb.Bytecode(suite, eff, {})
behaviors = run(selected, method_id, bytecode=bytecode)
```

`run()` returns the dictionary without writing predictions to stdout. A future
Jev analyzer entry point can call `engine.emit(behaviors)` to send it to JPAMB.
If the method is omitted, `run(selected)` reads JPAMB's sole method/`info`
argument from `sys.argv`. Supplying the method explicitly is recommended for
integration. No Jev selection logic, method routing, or source files are changed.

## Combination semantics and budgets

Each static domain runs independently with its existing 300-step budget. An
outcome is excluded from the intersection if any completed static analysis says
`no`. Missing, unsupported, incomplete, or possible results do not exclude it.
Even a static `yes` is treated as possibility, not a concrete witness. In
particular, static sign plus static string is different from running the existing
cooperating `--abstractions sign,string` configuration.

Each dynamic technique runs independently with seed 0 and the existing budgets:
10 random trials, small depth 3, 30 mutation attempts after seeds, and 200
interpreter steps per input. Mutation receives feedback from its own executions.
This intentionally differs from the existing combined dynamic CLI, whose
mutation corpus can depend on outcomes observed by earlier fuzzers.

The final merge applies, in order:

1. Any dynamic `found`/`yes` yields `yes`. A static exclusion also logs a disagreement.
2. Otherwise, any static `no` yields `no`.
3. Otherwise, dynamic `no` yields `no` only with an explicit completeness guarantee
   for that query and method.
4. Everything else yields `maybe`.

The current fuzzers supply no completeness guarantees. Not finding an outcome
does not prove absence. Their `*` observation is a bounded timeout and becomes
`maybe`, never a witness of nontermination. Unsupported executions preserve prior
witnesses. These rules assume valid dynamic witnesses and sound static exclusions.

## Future coverage fuzzer

Register a new adapter without editing the combination algorithm:

```python
from engine import Evidence, register, run
from my_coverage_adapter import analyze_coverage

# analyze_coverage(bytecode, method_id) must return Evidence.
# Typical sampled evidence: Evidence({"ok": "found", "*": "timeout"})
register("dynamic_coverage", "dynamic", analyze_coverage)
behaviors = run(["static_sign", "dynamic_coverage"], method_id)
```

Once the implementation exists, add that registration to engine initialization
to expose it through the stock CLI too. Until registered, `dynamic_coverage`
raises a clear unknown/unimplemented-name error. A custom launcher can also
register it and call `engine.main()`.

Only an adapter that actually establishes exhaustive, complete execution for a
query may return, for example, `Evidence({"ok": "no"}, frozenset({"ok"}))`.
Coverage saturation or exhausting a bounded input set is insufficient.

## Tests

```bash
python -m unittest discover -s tests -p test_engine.py -v
python -m pytest tests/test_engine.py tests/test_engine_integration.py -q
python -m pytest solutions/static/tests solutions/dynamic/tests -q
```

The pure tests cover the merge table, all 64 technique subsets, ordering,
deduplication, query-specific completeness, diagnostics, budgets, unsupported
execution, and extension registration. Integration tests use the real analyzers,
the built benchmark, and JPAMB's metadata/prediction parsers and scoring types.
