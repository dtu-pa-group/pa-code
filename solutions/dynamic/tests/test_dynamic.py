import random

import dynamic
import pytest

import jpamb
import jvm


def method_with(parameters: str) -> jvm.AbsMethodID:
    return jvm.AbsMethodID.decode(f"Example.method:({parameters})V")


def test_fuzz_int_stays_in_jvm_range_and_samples_boundaries():
    rand = random.Random(0)
    values = [dynamic.fuzz_int(rand) for _ in range(100)]

    assert all(dynamic.I32_MIN <= value <= dynamic.I32_MAX for value in values)
    assert any(value in dynamic.INTERESTING_INTS for value in values)


def test_fuzz_input_supports_all_benchmark_parameter_types():
    methodid = method_with("IZ[I[CLjava/lang/String;")

    generated = dynamic.fuzz_input(random.Random(0), methodid)

    assert len(generated.values) == 5
    assert isinstance(generated.values[0], jpamb.case.Int)
    assert isinstance(generated.values[1], jpamb.case.Boolean)

    int_array = generated.values[2]
    assert isinstance(int_array, jpamb.case.Array)
    assert isinstance(int_array.contains, jvm.Int)
    assert len(int_array.values) <= dynamic.MAX_SEQUENCE_LENGTH
    assert all(
        dynamic.I32_MIN <= value <= dynamic.I32_MAX for value in int_array.values
    )

    char_array = generated.values[3]
    assert isinstance(char_array, jpamb.case.Array)
    assert isinstance(char_array.contains, jvm.Char)
    assert len(char_array.values) <= dynamic.MAX_SEQUENCE_LENGTH
    assert all(char in dynamic.TEXT_ALPHABET for char in char_array.values)

    string = generated.values[4]
    assert isinstance(string, jpamb.case.String)
    assert len(string.value) <= dynamic.MAX_SEQUENCE_LENGTH
    assert all(char in dynamic.TEXT_ALPHABET for char in string.value)

    assert generated.parameter_types() == methodid.extension.params


def test_random_inputs_are_reproducible_and_respect_trial_count():
    methodid = method_with("IZ")

    first = list(dynamic.random_inputs(random.Random(42), methodid, trials=4))
    second = list(dynamic.random_inputs(random.Random(42), methodid, trials=4))

    assert first == second
    assert len(first) == 4


def test_random_inputs_reject_negative_trial_count():
    with pytest.raises(ValueError, match="trials"):
        list(dynamic.random_inputs(random.Random(0), method_with("I"), trials=-1))


def test_unsupported_parameter_has_a_useful_error():
    with pytest.raises(dynamic.UnsupportedInputType, match="random value"):
        dynamic.fuzz_input(random.Random(0), method_with("J"))


def test_execute_input_reports_terminal_behavior(monkeypatch):
    monkeypatch.setattr(dynamic, "initial", lambda *_: object())
    monkeypatch.setattr(dynamic, "step", lambda *_: (object(), "ok"))

    assert dynamic.execute_input(object(), object(), object(), max_steps=3) == "ok"


def test_execute_input_reports_bounded_timeout(monkeypatch):
    state = object()
    monkeypatch.setattr(dynamic, "initial", lambda *_: state)
    monkeypatch.setattr(dynamic, "step", lambda *_: (object(), state))

    assert dynamic.execute_input(object(), object(), object(), max_steps=3) == "*"
