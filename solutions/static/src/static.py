import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import dataclass

from abstractions import SignSet

import jpamb
import sexpr
from jpamb import jvm
from jvm.state import PC, StackInt


@dataclass(frozen=True)
class State(sexpr.AsSExpr):
    locals: tuple[SignSet, ...]
    stack: tuple[SignSet, ...]

    def __post_init__(self):
        assert isinstance(self.locals, tuple)
        assert isinstance(self.stack, tuple)

    def __str__(self):
        return f"{', '.join(map(str, self.locals))}/{':'.join(map(str, self.stack))}"

    def __or__(self, other):
        assert isinstance(other, State), f"Expected State but got {other!r}"
        assert len(self.stack) == len(other.stack), "Stacks should be equal lenght"
        assert len(self.locals) == len(other.locals), "Locals should be equal lenght"

        return State(
            tuple(s1 | s2 for s1, s2 in zip(self.locals, other.locals)),
            tuple(s1 | s2 for s1, s2 in zip(self.stack, other.stack)),
        )

    def push(self, value: SignSet):
        assert isinstance(value, SignSet), f"Expected sign set but got {value}"
        return State(self.locals, self.stack + (value,))

    def pop(self, number=1):
        return self.stack[-number:], State(self.locals, self.stack[:-number])

    def load(self, index):
        return self.locals[index]

    def store(self, index, value):
        return State(
            tuple(self.locals[:index]) + (value,) + tuple(self.locals[index + 1 :]),
            self.stack,
        )


# Handle one instruction and produce possible next states or final outcomes.
# Division such as 10 / n can report division by zero and also
# continue with the possible result signs {-, 0, +} kept together in one state.
# A later condition can create two paths. Currently their variable signs stay
# the same, but their next instruction positions differ. The worklist follows
# these paths through later calls to this function.
def manystep(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
) -> Iterable[tuple[PC, object] | str]:
    opr = bc[pc]
    match opr:
        case jvm.Push(type=jvm.Int(), value=value):
            abstract_value = SignSet.abstract([StackInt(value)])
            yield (pc + 1, state.push(abstract_value))

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            if field.extension.name != "$assertionsDisabled":
                raise NotImplementedError(f"Unsupported field: {field}")

            # Hack - Assuming assertions are never disabled
            va = SignSet.abstract([StackInt(0)])

            yield (pc + 1, state.push(va))

        case jvm.Ifz(condition=op, target=target):
            [val], after = state.pop(1)

            for res in SignSet.compare(val, SignSet.abstract([StackInt(0)]), op):
                match res:
                    case True:
                        yield (pc % target, after)
                    case False:
                        yield (pc + 1, after)
                    case err:
                        yield err

        case jvm.Load(index=i):
            va = state.load(i)
            yield (pc + 1, state.push(va))

        case jvm.Store(type=jvm.Int(), index=index):
            [value], after = state.pop(1)
            yield (pc + 1, after.store(index, value))

        case jvm.If(condition=operation, target=target):
            [left, right], after = state.pop(2)
            for answer in left.compare(right, operation):
                if answer:
                    yield (pc % target, after)
                else:
                    yield (pc + 1, after)

        case jvm.Incr(index=index, amount=amount):
            increment = SignSet.abstract([StackInt(amount)])
            result, _errors = state.load(index).arithmetic(increment, jvm.BinaryOpr.Add)
            yield (pc + 1, state.store(index, result))

        case jvm.Negate(type=jvm.Int()):
            [value], after = state.pop(1)
            zero = SignSet.abstract([StackInt(0)])
            result, _errors = zero.arithmetic(value, jvm.BinaryOpr.Sub)
            yield (pc + 1, after.push(result))

        case jvm.Goto(target=t):
            yield (pc % t, state)

        case jvm.Binary(type=jvm.Int(), operant=operation):
            operands, after = state.pop(2)
            left, right = operands
            result, errors = left.arithmetic(right, operation)

            for error in errors:
                yield error

            if result != SignSet.bot():
                yield (pc + 1, after.push(result))

        case jvm.Return(type=None):
            yield "ok"

        case jvm.Return(type=t):
            # Hack -- we assume that we always return.
            yield "ok"

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            yield "assertion error"

        case unsupported:
            raise NotImplementedError(f"Unsupported instruction: {unsupported}")


def initialstate(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    inputs: jpamb.Input | None,
) -> dict[PC, State]:
    method = bc.getmethod(methodid)
    locals = [SignSet.bot()] * method.max_locals    # Initially just {}

    for parameter in methodid.extension.params:
        if not isinstance(parameter, (jvm.Int, jvm.Boolean)):
            raise NotImplementedError(f"Unsupported parameter type: {parameter}")

    if inputs is None:
        for i, parameter in enumerate(methodid.extension.params):
            if isinstance(parameter, jvm.Boolean):
                locals[i] = SignSet.from_sign("0+")
            else:
                locals[i] = SignSet.top()
    else:
        for i, x in enumerate(inputs.values):
            match x:
                case jpamb.case.Boolean(value=value):
                    locals[i] = SignSet.abstract([StackInt(int(value))])
                case jpamb.case.Int(value=value):
                    locals[i] = SignSet.abstract([StackInt(int(value))])
                case _:
                    raise NotImplementedError(f"Unsupported value {x!r}")

    state = State(tuple(locals), ())
    return {PC(methodid, 0): state}


@dataclass
class AbstractInterpreter:
    bc: jpamb.Bytecode
    worklist: deque[PC]
    states: dict[PC, State]

    @staticmethod
    def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, inputs):
        states = initialstate(bc, methodid, inputs)
        worklist = deque(states.keys())

        return AbstractInterpreter(bc, worklist, states)

    def step(self) -> tuple[PC, set[str]]:      # Processing one instruction
        pc = self.worklist.pop()

        print(f"Stepping {pc}:\n > {self.bc[pc]}", file=sys.stderr)

        finals = set()

        for res in manystep(self.bc, pc, self.states[pc]):
            if isinstance(res, str):
                finals.add(res)
            else:
                pc_, st = res

                before = self.states.get(pc_, None)
                if before is None:
                    after = st
                else:
                    after = before | st
                if before is None or after != before:
                    self.states[pc_] = after
                    self.worklist.append(pc_)

        return pc, finals


def interpret():
    """The static analysis"""
    methodid, input, steps = jpamb.getcase(
        "static",
        "1.0",
        "Los Pollos Hermanos",
        ["static", "sign", "python"],
        for_science=True,
    )
    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    ai = AbstractInterpreter.initial(bc, methodid, input)

    x = jpamb.emit_init(ai.states)

    while steps > 0 and ai.worklist:
        pc, final = ai.step()
        for f in final:
            jpamb.emit_step(x, pc, f, depth=1)
            steps -= 1

        x = jpamb.emit_step(x, pc, ai.states, depth=1)
        steps -= 1


def analyse():
    """The static analysis"""

    methodid = jpamb.getmethodid(
        "static",
        "1.0",
        "Los Pollos Hermanos",
        ["static", "sign", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    steps = 300

    final = set()
    incomplete = False

    try:
        ai = AbstractInterpreter.initial(bc, methodid, None)
        while steps > 0 and ai.worklist:
            _pc, finals = ai.step()
            final |= finals
            steps -= 1
        incomplete = bool(ai.worklist)
    except NotImplementedError as error:
        print(error, file=sys.stderr)
        incomplete = True

    for outcome in jpamb.QUERIES:
        if outcome in final:
            prediction = "maybe"
        elif incomplete or outcome == "*":
            # Sign analysis alone does not establish termination.
            prediction = "unknown"
        else:
            prediction = "no"
        print(f"{outcome};{prediction}")
