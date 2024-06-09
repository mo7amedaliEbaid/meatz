import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatz/data/models/about.dart';

abstract class AboutRemoteDataSource {
  Future<AboutModel> getAbout();
}

class AboutRemoteDataSourceImpl extends AboutRemoteDataSource {
  final FirebaseFirestore firestore;

  AboutRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<AboutModel> getAbout() async {
    final snapshot = await firestore.collection('about').get();
    return snapshot.docs
        .map((doc) => AboutModel.fromSnapshot(doc))
        .toList()
        .first;
  }
}
