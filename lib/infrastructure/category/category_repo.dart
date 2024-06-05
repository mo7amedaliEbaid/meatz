import 'package:dartz/dartz.dart';
import 'package:meatz/domain/categories/category_entity.dart';

import '../../core/error/failures.dart';

abstract class ICategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
