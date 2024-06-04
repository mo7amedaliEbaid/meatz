// lib/domain/use_cases/get_categories.dart
import '../entities/category.dart';
import '../repositories/category.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
