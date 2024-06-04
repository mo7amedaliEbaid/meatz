// failures.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
@immutable
abstract class ValueFailure<T> {
  final T failedValue;

  const ValueFailure(this.failedValue);

  String map({
    required String  invalidEmail,
    required String  shortPassword,
  }) {
    if (this is InvalidEmail<T>) {
      return invalidEmail;
    } else if (this is ShortPassword<T>) {
      return shortPassword;
    } else {
      throw UnimplementedError();
    }
  }
}

class InvalidEmail<T> extends ValueFailure<T> {
  const InvalidEmail({required T failedValue}) : super(failedValue);
}

class ShortPassword<T> extends ValueFailure<T> {
  const ShortPassword({required T failedValue}) : super(failedValue);
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
