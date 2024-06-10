import 'package:meatz/domain/repositories/about.dart';

import '../entities/info.dart';

class GetAbout {
  final AboutRepository aboutRepository;

  GetAbout({
    required this.aboutRepository,
  });

  Future<Info> call() async {
    return await aboutRepository.getAbout();
  }
}
