// failures.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ValueFailure<T> {
  const ValueFailure();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueFailure<T>;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'ValueFailure<$T>';
}

class InvalidEmail<T> extends ValueFailure<T> {
  final String failedValue;

  const InvalidEmail({required this.failedValue});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvalidEmail<T> && other.failedValue == failedValue;
  }

  @override
  int get hashCode => failedValue.hashCode;

  @override
  String toString() => 'InvalidEmail(failedValue: $failedValue)';
}

class ShortPassword<T> extends ValueFailure<T> {
  final String failedValue;

  const ShortPassword({required this.failedValue});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortPassword<T> && other.failedValue == failedValue;
  }

  @override
  int get hashCode => failedValue.hashCode;

  @override
  String toString() => 'ShortPassword(failedValue: $failedValue)';
}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
