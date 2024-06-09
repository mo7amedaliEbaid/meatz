import '../entities/about.dart';

abstract class AboutRepository {
  Future<About> getAbout();
}
