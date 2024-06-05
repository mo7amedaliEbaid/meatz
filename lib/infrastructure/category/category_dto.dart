

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/categories/category_entity.dart';

class CategoryDTO {
  final int id;
  final String name;
  final String image;

  CategoryDTO({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryDTO.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryDTO(
      id: data['id'],
      name: data['name'],
      image: data['image'],
    );
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      image: image,
    );
  }
}
