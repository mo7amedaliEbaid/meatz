import 'package:meatz/data/data_sources/terms.dart';
import 'package:meatz/domain/entities/info.dart';
import 'package:meatz/domain/repositories/terms.dart';

class TermsRepositoryImpl extends TermsRepository {
  final TermsRemoteDataSource termsRemoteDataSource;

  TermsRepositoryImpl({
    required this.termsRemoteDataSource,
  });

  @override
  Future<Info> getTerms() async {
    return await termsRemoteDataSource.getTerms();
  }
}
