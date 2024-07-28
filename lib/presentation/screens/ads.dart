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
          positionedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouter.onboarding);
            },
          )
        ],
      ),
    );
  }
}
