import 'package:meatz/domain/repositories/about.dart';

import '../entities/about.dart';

class GetAbout {
  final AboutRepository aboutRepository;

  GetAbout({
    required this.aboutRepository,
  });

  Future<About> call() async {
    return await aboutRepository.getAbout();
  }
}
