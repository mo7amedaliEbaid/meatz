import 'package:flutter/material.dart';

import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {
  static const String splash = '/';
  static const String ads = '/ads';
  static const String onboarding = '/onboarding';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
