import 'package:flutter/material.dart';
import 'package:meatz/presentation/screens/home.dart';

import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {
  static const String splash = '/';
  static const String ads = '/ads';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen()); case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
