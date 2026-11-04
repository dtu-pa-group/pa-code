import random
import sys
from itertools import product

import jpamb
import jvm
import jvm.state as jvmc


def binary(op, v1: int, v2: int) -> int | str:
    match op:
        case jvm.BinaryOpr.Div:
            try:
                return v1 // v2
            except ZeroDivisionError:
                return "divide by zero"
        case a:
            raise NotImplementedError(f"Unhandled binary {op!r}")


def compare(op, v1: int, v2: int) -> bool:
    match op:
        case jvm.CmpOpr.Eq:
            return v1 == v2
        case _:
            raise NotImplementedError(f"Unhandled comparation {op!r}")


def step(bc: jpamb.Bytecode, state: jvmc.State) -> tuple[jvmc.PC, jvmc.State | str]:
    assert isinstance(state, jvmc.State), f"expected state but got {state}"
    frame = state.frames.peek()
    pc = frame.pc
    opr = bc[pc]
    output = state
    print(f"Stepping {pc}:\n > {opr}", file=sys.stderr)
    match opr:
        case jvm.Push(type=t, value=v):
            if t is jvm.Int():
                frame.stack.push(jvmc.StackInt(v))
            else:
                raise NotImplementedError("Error")
            frame.pc += 1

        case jvm.Binary(type=jvm.Int(), operant=op):
            v2, v1 = frame.stack.pop(), frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            value = binary(op, v1.value, v2.value)

            if isinstance(value, str):
                output = value
            else:
                frame.stack.push(jvmc.StackInt(value))
                frame.pc += 1

        case jvm.Return(type=t):
            if t is not None:
                raise NotImplementedError("Still to be done")

            state.frames.pop()

            if state.frames:
                raise NotImplementedError("Still to be done")
            else:
                output = "ok"

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            frame.stack.push(jvmc.StackInt(0))
            frame.pc += 1

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            output = "assertion error"

        case a:
            raise NotImplementedError(a.help())

    assert isinstance(output, (jvmc.State, str))

    return pc, output


def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, input: jpamb.Input):
    frame = jvmc.Frame.from_method(bc.getmethod(methodid))
    state = jvmc.State(jvmc.Heap(), jvmc.CallStack.from_frames([frame]))
    for i, v in enumerate(input.values):
        # Convert arbitrary values into local values
        match v:
            case jpamb.case.Boolean(value):
                frame.locals[i] = jvmc.StackInt(1 if value else 0)
            case jpamb.case.Int(value):
                frame.locals[i] = jvmc.StackInt(value)
            case jpamb.case.Array(contains=type, values=values):
                match type:
                    case jvm.Char():
                        ref = state.heap.new(
                            jvmc.HeapArray(type, [ord(a) for a in values])
                        )
                    case jvm.Int():
                        ref = state.heap.new(jvmc.HeapArray(type, [a for a in values]))
                frame.locals[i] = ref
            case jpamb.case.String(value=value):
                ref = state.heap.new(jvmc.HeapString(value))
                frame.locals[i] = ref
            case a:
                raise NotImplementedError(
                    f"Do not know how to convert values of type {a!r} to a local value"
                )

    return state


def interpret():
    """The entry point for the interpreter"""

    methodid, input, max_steps = jpamb.getcase(
        "dynamic",
        "1.0",
        "The Rice Theorem Cookers",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    state = initial(bc, methodid, input)

    last = jpamb.emit_init(state)

    for x in range(max_steps):
        pc, state = step(bc, state)
        last = jpamb.emit_step(last, pc, state)

        if isinstance(state, str):
            break


def fuzz_input(rand: random.Random, methodid: jvm.AbsMethodID) -> jpamb.case.Input:
    input = []
    # 1. come up with possible inputs
    for p in methodid.extension.params:
        match p:
            case jvm.Int():
                input.append(jpamb.case.Int(rand.randint(-(1 << 31), 1 << 31)))
            case jvm.Boolean():
                input.append(jpamb.case.Boolean(1 == rand.randint(0, 1)))
            case a:
                raise NotImplementedError(
                    "Don't know how to create random values for {input}"
                )

    return jpamb.case.Input(input)


def random_inputs(rand, methodid):
    """Supply the ten trials used by the random fuzzer."""
    for trial in range(10):
        yield fuzz_input(rand, methodid)


def fuzz_small(rand, methodid, max_depth=3):
    """Try small arguments in order of their largest integer magnitude."""
    if max_depth < 0:
        raise ValueError("max_depth must be zero or greater")

    parameters = methodid.extension.params
    for parameter in parameters:
        if not isinstance(parameter, (jvm.Int, jvm.Boolean)):
            print(f"SmallCheck cannot generate parameter type {parameter}", file=sys.stderr)
            return
        
    # Initialize with 0, or with True and False
    integers = [jpamb.case.Int(0)]
    booleans = [jpamb.case.Boolean(False), jpamb.case.Boolean(True)]

    for depth in range(max_depth + 1):
        if depth > 0:
            integers.append(jpamb.case.Int(depth))
            integers.append(jpamb.case.Int(-depth))

        choices_by_parameter = []
        for parameter in parameters:
            if isinstance(parameter, jvm.Int):
                choices_by_parameter.append(integers)   # In the first run, 0 is appended
            else:
                choices_by_parameter.append(booleans)   # In the first run, True and False is appended

        # Pick one value per parameter, in method-signature order.
        for arguments in product(*choices_by_parameter): # Can be (0, False), (0, True)
            # Boolean-only and empty argument lists have depth zero.
            argument_depth = 0
            for argument in arguments:
                if isinstance(argument, jpamb.case.Int):
                    magnitude = abs(argument.value)
                    argument_depth = max(argument_depth, magnitude)

            if argument_depth == depth:
                input_case = jpamb.case.Input(list(arguments))
                yield input_case


def analyse():
    """The dynamic analysis, e.g. in this case a (dumb) fuzzer."""

    methodid = jpamb.getmethodid(
        "dynamic",
        "1.0",
        "Los Pollos Hermanos",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    MAX_STEPS = 200

    import random

    # Make the randomness deterministic
    rand = random.Random(0)

    behaviors = set()
    # Choose one input strategy.
    inputs = random_inputs(rand, methodid)
    # inputs = fuzz_small(rand, methodid)
    for input in inputs:
        state = initial(bc, methodid, input)

        for x in range(MAX_STEPS):  # Runs each step and looks for an output like "ok" or "divide by zero"
            _, state = step(bc, state)
            if isinstance(state, str):
                behaviors.add(state)    # If end state is found, it breaks and takes next input
                break

    for query in jpamb.QUERIES:
        if query in behaviors:
            if query == "*":
                print(f"{query};timeout")
            else:
                print(f"{query};found")
        else:
            print(f"{query};not-found")
