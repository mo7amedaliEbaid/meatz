import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatz/data/models/info.dart';

abstract class AboutRemoteDataSource {
  Future<InfoModel> getAbout();
}

class AboutRemoteDataSourceImpl extends AboutRemoteDataSource {
  final FirebaseFirestore firestore;

  AboutRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<InfoModel> getAbout() async {
    final snapshot = await firestore.collection('about').get();
    return snapshot.docs
        .map((doc) => InfoModel.fromSnapshot(doc))
        .toList()
        .first;
  }
}
