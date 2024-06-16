import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../application/application.dart';
import '../../presentation/screens/home.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return /*BlocProvider(
      create: (context) => LocaleCubit(const Locale("ar")),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return*/
        MaterialApp(
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
      // locale: state.locale,
      /*      localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],*/
      // home: CategoryScreen(),
      /* supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'EG'),
            ],
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.splash,
            theme: ThemeData(
              fontFamily: AppStrings.fontFamily
            ),*/
    );
    /*},
      ),
    );*/
  }
}
