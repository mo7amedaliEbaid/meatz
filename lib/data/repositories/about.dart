import 'package:meatz/data/data_sources/about.dart';
import 'package:meatz/domain/entities/info.dart';
import 'package:meatz/domain/repositories/about.dart';

class AboutRepositoryImpl extends AboutRepository {
  final AboutRemoteDataSource aboutRemoteDataSource;

  AboutRepositoryImpl({
    required this.aboutRemoteDataSource,
  });

  @override
  Future<Info> getAbout() async {
    return await aboutRemoteDataSource.getAbout();
  }
}
