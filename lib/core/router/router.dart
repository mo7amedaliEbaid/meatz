import 'package:flutter/material.dart';

import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {
  static const String splash = '/';


  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      
      default:
        throw const RouteException('Route not found!');
    }
  }
}
