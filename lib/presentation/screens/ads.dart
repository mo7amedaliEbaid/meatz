import 'package:flutter/material.dart';

import 'package:meatz/configs/configs.dart';

import 'package:meatz/core/core.dart';
import 'package:meatz/presentation/widgets.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.ads,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: AppDimensions.normalize(8),
            right: AppDimensions.normalize(5),
            child: customElevatedButton(
              width: AppDimensions.normalize(45),
              height: AppDimensions.normalize(20),
              color: AppColors.deepRed,
              borderRadius: AppDimensions.normalize(10),
              textKey: 'skip',
              textStyle: AppText.h3!.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.onboarding);
              },
            ),
          )
        ],
      ),
    );
  }
}
