import '../domain.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
