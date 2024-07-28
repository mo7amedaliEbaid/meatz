import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/application/application.dart';

import '../../di/di.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<AboutBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<CategoryBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Meatz',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
        theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.deepRed,
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}
