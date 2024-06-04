// lib/data/repositories/category_repository_impl.dart
import '../../domain/entities/category.dart';
import '../../domain/repositories/category.dart';
import '../data_sources/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
