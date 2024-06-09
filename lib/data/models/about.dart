import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatz/domain/entities/about.dart';

class AboutModel extends About {
  AboutModel({
    required String title,
    required String content1,
    required String content2,
  }) : super(
          title: title,
          content1: content1,
          content2: content2,
        );

  factory AboutModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return AboutModel(
      title: snapshot['title'],
      content1: snapshot['content1'],
      content2: snapshot['content2'],
    );
  }
}
