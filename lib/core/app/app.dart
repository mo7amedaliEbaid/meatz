import 'package:flutter/material.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.splash,
      theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.deepRed,
            centerTitle: true,
          )),
    );
  }
}
