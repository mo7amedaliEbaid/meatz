import 'package:flutter/material.dart';
import 'package:meatz/configs/configs.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold();
  }
}
