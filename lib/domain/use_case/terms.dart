import 'package:meatz/domain/repositories/terms.dart';

import '../entities/info.dart';

class GetTerms {
  TermsRepository termsRepository;

  GetTerms({
    required this.termsRepository,
  });

  Future<Info> call() async {
    return await termsRepository.getTerms();
  }
}
