import '../entities/info.dart';

abstract class TermsRepository{
  Future<Info> getTerms();
}