import 'package:flutter/material.dart';

import '../../core/localization/repositories/localization.dart';

class TranslatedText extends StatelessWidget {
  final String translationKey;

  const TranslatedText({Key? key, required this.translationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalization.of(context);
    final translatedText = appLocalization.getTranslatedValue(translationKey);

    return Text(
      translatedText ?? '', // Handle null value gracefully
      style: TextStyle(),
    );
  }
}