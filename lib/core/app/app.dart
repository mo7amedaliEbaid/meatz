import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        BlocProvider(
          create: (context) => LocaleCubit(
            const Locale('en', 'US'),
          ),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Meatz',
            locale: state.locale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'EG'),
            ],
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
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
          );
        },
      ),
    );
  }
}
