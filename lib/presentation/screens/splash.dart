import 'package:flutter/material.dart';
import 'package:meatz/configs/configs.dart';
import 'package:meatz/core/core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.signIn,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.splash,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppAssets.logo3,
          ),
          Positioned(
            bottom: AppDimensions.normalize(90),
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
