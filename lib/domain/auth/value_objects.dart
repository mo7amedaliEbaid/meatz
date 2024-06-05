import 'package:dartz/dartz.dart';

import 'package:uuid/uuid.dart';

import '../core/failures.dart';
import '../core/value_validators.dart';




class ValueObject<T> {
  final Either<ValueFailure<T>, T> value;

  const ValueObject(this.value);

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), (r) => r);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(Either<ValueFailure<String>, String> value) : super(value);
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(Either<ValueFailure<String>, String> value) : super(value);
}
class UniqueId {
  final String value;

  factory UniqueId() {
    return UniqueId._(const Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(uniqueId);
  }

  const UniqueId._(this.value);
}