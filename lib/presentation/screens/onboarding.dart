import 'package:flutter/material.dart';
import 'package:meatz/configs/app_dimensions.dart';
import 'package:meatz/configs/app_typography.dart';
import 'package:meatz/configs/configs.dart';
import 'package:meatz/configs/space.dart';
import 'package:meatz/core/constants/assets.dart';

import '../../core/localization/widgets/translated_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.splash,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Space.yf(5),
              Image.asset(
                AppAssets.logo,
                height: AppDimensions.normalize(72),
              ),
              Space.yf(5),
              TranslatedText(
                translationKey: 'selectLang',
                textStyle: AppText.h2!.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
