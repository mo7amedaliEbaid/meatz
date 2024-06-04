// lib/data/models/category_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required int id, required String name, required String image})
      : super(id: id, name: name, image: image);

  factory CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CategoryModel(
      id: snapshot['id'],
      name: snapshot['name'],
      image: snapshot['image'],
    );
  }
}
