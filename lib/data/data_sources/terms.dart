import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/info.dart';

abstract class TermsRemoteDataSource {
  Future<InfoModel> getTerms();
}

class TermsRemoteDataSourceImpl extends TermsRemoteDataSource {
  final FirebaseFirestore firestore;

  TermsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<InfoModel> getTerms() async {
    final snapshot = await firestore.collection('terms').get();
    return snapshot.docs
        .map((doc) => InfoModel.fromSnapshot(doc))
        .toList()
        .first;
  }
}
