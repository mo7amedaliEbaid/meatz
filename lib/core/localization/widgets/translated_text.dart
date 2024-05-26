import 'package:flutter/material.dart';

import '../repositories/localization.dart';

class TranslatedText extends StatelessWidget {
  final String translationKey;
  final TextStyle textStyle;

  const TranslatedText({
    Key? key,
    required this.translationKey,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalization.of(context);
    final translatedText = appLocalization.getTranslatedValue(translationKey);

    return Text(
      translatedText ?? '', // Handle null value gracefully
      style: textStyle,
    );
  }
}
