// value_objects.dart
import 'package:dartz/dartz.dart';

import 'failures.dart';

abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObject();

  bool isValid() => value.isRight();

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



