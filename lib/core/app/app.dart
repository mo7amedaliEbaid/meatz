import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/application/application.dart';
import 'package:meatz/data/data_sources/about.dart';
import 'package:meatz/data/repositories/about.dart';
import 'package:meatz/domain/use_case/about.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AboutBloc(
              getAbout: GetAbout(
                aboutRepository: AboutRepositoryImpl(
                  aboutRemoteDataSource: AboutRemoteDataSourceImpl(
                    firestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
            ),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
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
        ));
  }
}
