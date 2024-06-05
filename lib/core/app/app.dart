import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meatz/domain/auth/i_auth_facade.dart';
import 'package:meatz/presentation/screens/categories.dart';

import '../../application/application.dart';
import '../../infrastructure/auth/auth_facade.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(const Locale("ar")),
        ),
        BlocProvider(
          create: (context) => SignInFormBloc(
              FirebaseAuthFacade(FirebaseAuth.instance, GoogleSignIn())),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            locale: state.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'EG'),
            ],
            debugShowCheckedModeBanner: false,
           /* onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.splash,*/
            home: const CategoryPage(),
            theme: ThemeData(fontFamily: AppStrings.fontFamily),
          );
        },
      ),
    );
  }
}
