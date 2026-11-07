from abc import ABC, abstractmethod
from collections.abc import Iterable
from dataclasses import dataclass
from typing import Literal, Self

import jvm
import jvm.state as jvms


class Poset(ABC):
    @abstractmethod
    def __eq__(self, other: Self) -> bool: ...

    @abstractmethod
    def __lt__(self, other: Self) -> bool: ...

    def __le__(self, other: Self) -> bool:
        return self == other or self < other

    @abstractmethod
    def __gt__(self, other: Self) -> bool: ...

    def __ge__(self, other: Self) -> bool:
        return self == other or self > other


def is_reflexive(a: Poset):
    # Checking if the relation is reflexive (a == a)
    assert a == a, f"Reflexivity check failed: Element {a} is not related to itself."  # noqa: PLR0124


def is_antisymmetric(a: Poset, b: Poset):
    if a != b:
        # Checking that if a <= b and b <= a, then a must equal b
        assert not (a <= b <= a), (
            f"Antisymmetry violation: Found elements where {a} <= {b} and {b} <= {a}, "
            f"but {a} != {b}."
        )


def is_transitive(a: Poset, b: Poset, c: Poset):
    if a <= b <= c:
        # Checking that if a <= b and b <= c, then a <= c
        assert a <= c, (
            f"Transitivity violation: Found path {a} <= {b} and {b} <= {c}, "
            f"but {a} is not related to {c}."
        )


def is_poset(a: Poset, b: Poset, c: Poset):
    for x in [a, b, c]:
        is_reflexive(x)

    for x in [b, c]:
        is_antisymmetric(a, x)

    is_transitive(a, b, c)


class Lattice(Poset):
    @classmethod
    @abstractmethod
    def top(cls) -> Self:
        raise NotImplementedError(f"top: {cls}")

    @classmethod
    def bot(cls) -> Self:
        return cls.abstract([])

    @abstractmethod
    def __or__(self, other: Self) -> Self: ...

    @abstractmethod
    def __and__(self, other: Self) -> Self: ...


def is_lattice_identities(a: Lattice):
    # Top element identity checks
    assert (a | a.top()) == a.top(), (
        f"Top identity fail: ({a} | {a.top()}) -> {a | a.top()} != {a.top()}"
    )
    assert (a.top() | a) == a.top(), (
        f"Top identity fail (commute): ({a.top()} | {a}) != {a.top()}"
    )
    assert (a & a.top()) == a, f"Top identity fail (meet): ({a} & {a.top()}) != {a}"
    assert (a.top() & a) == a, (
        f"Top identity fail (meet commute): ({a.top()} & {a}) != {a}"
    )

    # Bottom element identity checks
    assert (a & a.bot()) == a.bot(), (
        f"Bottom identity fail: ({a} & {a.bot()}) != {a.bot()}"
    )
    assert (a.bot() & a) == a.bot(), (
        f"Bottom identity fail (commute): ({a.bot()} & {a}) != {a.bot()}"
    )
    assert (a.bot() | a) == a, f"Bottom identity fail (join): ({a.bot()} | {a}) != {a}"
    assert (a | a.bot()) == a, (
        f"Bottom identity fail (join commute): ({a} | {a.bot()}) != {a}"
    )


def is_lattice(a: Lattice, b: Lattice, c: Lattice):
    for x in [a, b, c]:
        is_lattice_identities(x)

    if not (a | b <= c):
        # Calculate values for the error message
        assert not (a <= c and b <= c), (
            f"Upper bound check failed: ({a} | {b}) -> {a | b} is not <= {c}. "
            f"Check individual bounds: {a <= c=}, {b <= c=}."
        )

    if not (c <= a & b):
        # Calculate values for the error message
        assert not (c <= a and c <= b), (
            f"Lower bound check failed: {c} is not <= ({a} & {b}) -> {a & b}. "
            f"Check individual bounds: {c <= a=}, {c <= b=}."
        )


class Abstraction(ABC):
    """This is the minimal interface for an abstraction."""

    @classmethod
    @abstractmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        raise NotImplementedError(f"abstract: {cls}")

    @abstractmethod
    def __contains__(self, value: jvms.StackValue) -> bool: ...


def is_galoi(a: set[jvms.StackValue], b: Abstraction):
    alpha_a = b.abstract(a)

    for value in a:
        assert value in alpha_a, f"{value} not in {a}"

    if alpha_a <= b:
        for value in a:
            assert value in b, f"{value} not in {b}"


type Sign = Literal[-1, 0, 1]


def to_sign(value: jvms.StackValue) -> Sign:
    match value:
        case jvms.StackInt(v):
            return (v > 0) - (v < 0)
        case a:
            raise NotImplementedError(f"Unsupported value {value!r}")


@dataclass(frozen=True)
class SignSet(Abstraction, Lattice):
    signs: frozenset[Sign]

    def __str__(self):
        return f"{{{''.join(z for z, b in zip('-0+', [-1, 0, 1]) if b in self.signs)}}}"

    def __sexpr__(self):
        return str(self)

    @classmethod
    def from_sign(cls, code):
        return cls(frozenset(b for z, b in zip("-0+", [-1, 0, 1]) if z in code))

    @classmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        signs = set()
        for value in values:
            signs.add(to_sign(value))
        return cls(frozenset(signs))

    def __contains__(self, value: jvms.StackValue) -> bool:
        return to_sign(value) in self.signs

    @classmethod
    def top(cls) -> Self:
        return cls(frozenset([-1, 0, 1]))

    def __or__(self, other: "SignSet") -> "SignSet":
        if not isinstance(other, SignSet):
            return NotImplemented

        return SignSet(self.signs | other.signs)

    def __and__(self, other: "SignSet") -> "SignSet":
        if not isinstance(other, SignSet):
            return NotImplemented

        return SignSet(self.signs & other.signs)

    # Ordering describes inclusion of possibilities, not numeric magnitude.
    def __lt__(self, other: "SignSet") -> bool:
        if not isinstance(other, SignSet):
            return NotImplemented
        return self.signs < other.signs

    def __gt__(self, other: "SignSet") -> bool:
        if not isinstance(other, SignSet):
            return NotImplemented
        return self.signs > other.signs

    def arithmetic(
        self, other: "SignSet", opr: jvm.BinaryOpr
    ) -> tuple["SignSet", set[str]]:
        output = set()
        errors = set()

        # Each pair represents all Java integers with those two signs.
        # Empty operands produce no pairs, so their result stays empty.
        for left in self.signs:
            for right in other.signs:
                match opr:
                    case jvm.BinaryOpr.Add:
                        if left == 0:
                            output.add(right)
                        elif right == 0:
                            output.add(left)
                        else:
                            # Overflow prevents assuming that equal signs stay equal.
                            output.update([-1, 0, 1])

                    case jvm.BinaryOpr.Sub:
                        if right == 0:
                            output.add(left)
                        elif left == 0:
                            output.add(-right)
                            if right == -1:
                                # Negating Integer.MIN_VALUE still gives a negative.
                                output.add(-1)
                        else:
                            output.update([-1, 0, 1])

                    case jvm.BinaryOpr.Mul:
                        if left == 0 or right == 0:
                            output.add(0)
                        else:
                            # Multiplication may overflow to any sign, including zero.
                            output.update([-1, 0, 1])

                    case jvm.BinaryOpr.Div:
                        if right == 0:
                            errors.add("divide by zero")
                        elif left == 0:
                            output.add(0)
                        else:
                            # Java truncates towards zero: 1 / 2 is zero.
                            output.add(0)
                            output.add(left * right)
                            if left == -1 and right == -1:
                                # Integer.MIN_VALUE / -1 overflows to Integer.MIN_VALUE.
                                output.add(-1)

                    case jvm.BinaryOpr.Rem:
                        if right == 0:
                            errors.add("divide by zero")
                        else:
                            # A nonzero remainder has the dividend's sign.
                            output.add(0)
                            output.add(left)

                    case _:
                        raise NotImplementedError(f"Unsupported arithmetic: {opr}")

        return SignSet(frozenset(output)), errors

    def compare(self, other: "SignSet", opr: jvm.CmpOpr) -> Iterable[bool]:
        cases = set()
        for left in self.signs:
            for right in other.signs:
                # Two positive (or two negative) values may be equal or differ
                # in either direction. Signs alone cannot decide the comparison.
                if left == right and left != 0:
                    cases.update([True, False])
                    continue

                # Different signs, or two zeros, determine the answer exactly.
                match opr:
                    case jvm.CmpOpr.Eq:
                        cases.add(left == right)
                    case jvm.CmpOpr.Ne:
                        cases.add(left != right)
                    case jvm.CmpOpr.Lt:
                        cases.add(left < right)
                    case jvm.CmpOpr.Le:
                        cases.add(left <= right)
                    case jvm.CmpOpr.Gt:
                        cases.add(left > right)
                    case jvm.CmpOpr.Ge:
                        cases.add(left >= right)
                    case _:
                        raise NotImplementedError(f"Unsupported comparison: {opr}")
        return cases


from collections.abc import Iterable
from dataclasses import dataclass
from typing import Self


@dataclass(frozen=True)
class Interval(Abstraction, Lattice):
    min: int | None
    max: int | None

    def __str__(self):
        return f"{self.min if self.min is not None else '-inf'}:{self.max if self.max is not None else 'inf'}"

    def __sexpr__(self):
        return str(self)

    @classmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        raise NotImplementedError("TODO")

    def __contains__(self, value: jvms.StackValue) -> bool:
        raise NotImplementedError("TODO")

    @classmethod
    def top(cls) -> Self:
        raise NotImplementedError("TODO")

    def __or__(self, other: "Interval") -> "Interval":
        raise NotImplementedError("TODO")

    def __and__(self, other: "Interval") -> "Interval":
        raise NotImplementedError("TODO")

    def __lt__(self, other: "Interval") -> bool:
        raise NotImplementedError("TODO")

    def __gt__(self, other: "Interval") -> bool:
        raise NotImplementedError("TODO")
