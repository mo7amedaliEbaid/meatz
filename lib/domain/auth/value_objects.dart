import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';


import 'package:dartz/dartz.dart';


class ValueObject<T> {
  final Either<ValueFailure<T>, T> value;

  const ValueObject(this.value);

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), (r) => r);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
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
    return UniqueId._(Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(uniqueId);
  }

  const UniqueId._(this.value);
}