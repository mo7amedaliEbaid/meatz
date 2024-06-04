// lib/data/data_sources/category_remote_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseFirestore firestore;

  CategoryRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();
    return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
  }
}
