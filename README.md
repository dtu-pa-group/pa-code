# Program analysis with Jev and JPAMB

This is our DTU 02242 project repository, built on
[JPAMB: Java Program Analysis Micro Benchmarks](https://github.com/kalhauge/jpamb).
We are investigating whether Jev-guided selection of static abstractions and
dynamic fuzzers can reduce computation time while preserving behavioural
prediction accuracy. The commands below expose the available analyses; their
existence does not establish that Jev improves results.

JPAMB provides Java methods and expected behaviours for evaluation. An analyzer
receives a method identifier, without its test inputs or annotations, and reports
information about six outcomes: `ok`, `divide by zero`, `assertion error`,
`out of bounds`, `null pointer`, and `*` (nontermination). A bounded execution
timeout is uncertainty about termination, not proof that a method runs forever.

## Start here

Use WSL/Bash from the repository root. For a fresh machine, follow
[setup](docs/setup.md) to prepare the Java benchmark and dependencies first.

### Mix analyses with the engine

`engine.py` runs any selection of the existing techniques independently and
combines their predictions for each method. It does not change Jev or the
individual technique implementations. Use Python 3.13+ and the built benchmark:

```bash
cd /home/sweet/project_PA/pa-code
source .venv/bin/activate
# Install dependencies if needed:
uv pip install -e . -e solutions/static -e solutions/dynamic pytest hypothesis

# One technique across the suite:
jpamb analyse -- python engine.py --analyses static_sign

# A mixed selection across the suite:
jpamb analyse -- python engine.py --analyses static_sign,static_string,dynamic_small

# All six techniques:
jpamb analyse -- python engine.py --analyses static_sign,static_string,static_int,dynamic_random,dynamic_small,dynamic_mutation

# Quick comparison on a subset:
jpamb analyse --filter Simple --iterations 1 -- python engine.py --analyses static_int,dynamic_random

# One method directly, without suite scoring:
python engine.py --analyses static_sign,dynamic_small 'jpamb.cases.Simple.divideByN:(I)I'

# Check JPAMB metadata:
python engine.py --analyses static_sign,dynamic_small info

# Save a full-suite report using the default three iterations:
mkdir -p reports
jpamb analyse --report reports/engine.sexp -- python engine.py --analyses static_sign,dynamic_small
```

Available names are `static_sign`, `static_string`, `static_int` (interval),
`dynamic_random`, `dynamic_small`, and `dynamic_mutation`. `static_interval` is
also accepted as an alias. Any combination and any order work; duplicates run
only once. Keep the comma-separated list in one shell argument: omit spaces or
quote the whole list, such as `--analyses "static_sign, dynamic_small"`.

The engine intersects static possibilities and unions dynamic observations:

1. Any concrete dynamic witness gives `yes`. If static analysis excluded that
   behavior, the engine also logs the disagreement to stderr.
2. Otherwise, a static exclusion gives `no`.
3. A dynamic `no` is accepted only with an explicit complete-execution guarantee.
   None of the current fuzzers provides one.
4. All other cases give `maybe`. Not-found and timeout do not prove absence;
   timeout does not prove nontermination.

Each static domain runs separately, rather than cooperating within a single
abstract interpretation. Each fuzzer uses seed 0 and its own observations;
mutation feedback is local to its run. Existing technique budgets are retained,
so selecting more techniques increases total work.

The direct method command writes exactly one `outcome;result` line for each of
JPAMB's six queries. JPAMB's `analyse` command invokes the engine for every
selected benchmark method, compares predictions with ground truth, calibrates
the result categories, and computes the suite score. A direct engine call
returns predictions, not a numeric score.

For your teammate's future Jev integration, the Python interface is:

```python
from engine import run

selected = ["static_sign", "static_string", "dynamic_small"]
behaviors = run(selected, "jpamb.cases.Simple.divideByN:(I)I")
```

Jev will supply `selected` and the current method identifier. `run()` returns
the combined dictionary; an analyzer entry point can use `engine.emit(behaviors)`
to send it to JPAMB. Jev's selection and method-passing code remain your
teammate's responsibility and are not changed by this integration.

Run the engine tests with:

```bash
python -m pytest tests/test_engine.py tests/test_engine_integration.py -q
```

See the [engine guide](information/engine.md) for the full API, scoring details,
and registration of future techniques such as `dynamic_coverage`. Coverage
fuzzing must be implemented and registered before that name can be selected.

### Run the rule-based heuristic selector

`solutions/heuristics/rule_based.py` selects which `engine.py` techniques to run
for each method by inspecting its decompiled JVM bytecode in `target/decompiled/`.
It does not modify `engine.py` or the individual technique implementations:

```bash
# Run across the suite:
uv run jpamb analyse -- python solutions/heuristics/rule_based.py

# Quick run on a subset:
uv run jpamb analyse --filter Simple --iterations 1 -- python solutions/heuristics/rule_based.py

# One method directly, without suite scoring:
uv run python solutions/heuristics/rule_based.py 'jpamb.cases.Simple.divideByN:(I)I'

# Check JPAMB metadata:
uv run python solutions/heuristics/rule_based.py info
```

For each method, the selector parses the JVM parameter descriptor and inspects
the decompiled bytecode for String and array operations, integer arithmetic,
division, branches, backward-jump loops, type casts, recursion, and static
helper calls. It then applies nine rule groups (`R1a–R9b`) in priority order:

1. Methods with static helper calls, recursion, type casts (`R1a–R1b`), or loops
   (`R5a–R5b`) run compatible dynamic fuzzers only (`dynamic_small` and
   `dynamic_mutation` for up to two `int`/`boolean` parameters, `dynamic_mutation`
   for more than two `int`/`boolean` parameters, or `dynamic_random` for String
   and array parameters).
2. Methods with String or array logic (`R2–R4`), branch-guarded division (`R6`),
   numeric branches or arithmetic (`R7`), or short straight-line bytecode (`R8`)
   run the matching static domain(s) (`static_string`, `static_interval`,
   `static_sign`) paired with a compatible dynamic fuzzer so `engine.combine()`
   receives both static exclusions (`no`) and concrete dynamic witnesses (`yes`).
3. All other methods (`R9a–R9b`) fall back to the compatible dynamic fuzzer(s).

Each `jpamb analyse` run writes a sequential JSON log to
`solutions/heuristics/output/` (`output_1.json`, `output_2.json`, ...) recording
the selected `analyses` and combined `predictions` for every evaluated method.

The Python interface for querying the selector directly is:

```python
import sys
sys.path.insert(0, "solutions/heuristics")

from engine import run
from rule_based import select_for_method

method_id = "jpamb.cases.Simple.divideByN:(I)I"
selected = select_for_method(method_id)
behaviors = run(selected, method_id)
```

### Run a dynamic fuzzer

```bash
uv sync --project solutions/dynamic --group dev
source solutions/dynamic/.venv/bin/activate

jpamb analyse dynamic-analysis --random
jpamb analyse dynamic-analysis --small
jpamb analyse dynamic-analysis --mutation
jpamb analyse dynamic-analysis --random --small --mutation
```

No fuzzer flag defaults to random. Flags can be combined. The selected fuzzers
run sequentially and share a set of observed outcomes; findings are not voted
on or averaged. Mutation uses that shared set as feedback.

**Random runs currently use a fixed seed of 0.** Repeating a command repeats
its generated inputs. There is no `--seed` option yet. Each selected fuzzer
adds its own budget, so combined runs are not equal-budget comparisons.

The [dynamic analyzer guide](solutions/dynamic/README.md) explains supported
inputs, execution limits, testing, and how to construct commands from a selection.

### Run static analysis

Use the static environment when running the static analyzer:

```bash
uv sync --project solutions/static --group dev
source solutions/static/.venv/bin/activate

jpamb analyse static-analysis --abstractions sign
jpamb analyse static-analysis --abstractions interval
jpamb analyse static-analysis --abstractions string
jpamb analyse static-analysis --abstractions sign,interval,string
```

Sign is the default. Sign, interval, and string domains can be selected in any
combination. Integer modes also support one-dimensional int/char arrays using
conservative summaries. See the [static analyzer guide](solutions/static/README.md)
for branch refinement, domain combinations, tests, and limitations.

### Place options correctly

JPAMB options go **before** the analyzer name. Analyzer options go **after** it:

```bash
jpamb analyse --iterations 1 --filter Simple dynamic-analysis --small
jpamb analyse --report dynamic-report.sexp dynamic-analysis --random
```

The explicit separator form, such as `jpamb analyse -- dynamic-analysis --small`,
also works. Reports use S-expressions; `analyse --format=json` is not supported.
Full report validation expects the default three iterations.

## Understand the score before comparing configurations

JPAMB's score is not a count of discovered behaviours. It derives rewards and
penalties from the prediction categories across the evaluated methods. Running
more fuzzers may reveal a behaviour missing from the benchmark's answer key.

One verified omission is `normalizedDistance(0, -2147483648)`: actual Java
execution divides by zero because negating the minimum int overflows back to
itself. The current expected outcomes list only `ok` for this method.

For an explicitly labelled, experimental score with that omission corrected:

```bash
jpamb analyse --true dynamic-analysis --random --small --mutation
```

`--true` changes only an in-memory copy of the expected outcomes. It neither
suppresses discoveries nor changes benchmark files. It is available for any
analyzer; use the same scoring mode across comparisons. Without it, the original
benchmark is used. It cannot be combined with `--report`, because normal report
validation would use the original answer key. This correction is not a claim
that the rest of the benchmark is complete.

A local run on 19 November 2026, with 47 methods and three iterations, scored
124.37 with the original answer key and 157.34 with the correction. These are
configuration-specific observations, not general evidence of Jev's effectiveness.

## Project direction

The planned comparison includes individual analyses, supported fixed
combinations, and Jev selecting both static domains and fuzzers. Holding static
analysis fixed while selecting fuzzers is an additional comparison to isolate
the value of static-domain selection. Include selection overhead in runtime,
use independent expected outcomes, and distinguish timing repetitions from
experiments with different random seeds.

## Documentation

- [Project information](information/README.md): implementation and evaluation notes.
- [Branch refinement](information/branch_refinement.md): static-analysis behaviour and recorded results.
- [Benchmark rules](docs/rules.md): analyzer input/output and scoring protocol.
- [Python setup](docs/python.md): environments and entry points.
- [Interpreter evaluation](docs/interpret.md): concrete and abstract traces.
- [Extending JPAMB](docs/extending-jpamb.md): adding benchmark cases.
- [Rule-based heuristic selector](solutions/heuristics/rule_based.py): bytecode feature extraction, `R1a–R9b` routing rules, and `engine.py` integration.

The dynamic interpreter supports the instructions needed by the supplied
concrete cases, but is not a complete JVM. Unsupported executions are reported
on stderr. Static analysis has its own documented coverage limits. Read those
limits before interpreting a missed behaviour as evidence of impossibility.
