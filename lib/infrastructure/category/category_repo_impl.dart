import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meatz/domain/categories/category_entity.dart';

import '../../core/error/failures.dart';
import '../../domain/core/failures.dart';
import 'category_dto.dart';
import 'category_repo.dart';

class CategoryRepository implements ICategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository(this._firestore);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final querySnapshot = await _firestore.collection('categories').get();
      final categories = querySnapshot.docs
          .map((doc) => CategoryDTO.fromFirestore(doc).toDomain())
          .toList();
      return right(categories);
    } catch (e) {
      return left(const ServerFailure());
    }
  }
}
