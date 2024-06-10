import '../entities/info.dart';

abstract class AboutRepository {
  Future<Info> getAbout();
}
