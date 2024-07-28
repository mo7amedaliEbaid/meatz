import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/application/application.dart';
import 'package:meatz/configs/configs.dart';
import 'package:meatz/core/core.dart';
import 'package:meatz/presentation/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.splash,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Space.yf(5),
                  Image.asset(
                    AppAssets.logo,
                    height: AppDimensions.normalize(72),
                  ),
                  Space.yf(5),
                  TranslatedText(
                    translationKey: 'selectLang',
                    textStyle: AppText.h2!.copyWith(color: Colors.white),
                  ),
                  Space.yf(1.8),
                  BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, state) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customElevatedButton(
                              width: AppDimensions.normalize(60),
                              height: AppDimensions.normalize(20),
                              color: state.locale == const Locale('ar', 'EG')
                                  ? AppColors.deepRed
                                  : Colors.white,
                              borderRadius: AppDimensions.normalize(10),
                              textKey: "arabic",
                              textStyle: AppText.h2!.copyWith(
                                color: state.locale == const Locale('ar', 'EG')
                                    ? Colors.white
                                    : AppColors.blackish,
                              ),
                              onPressed: () {
                                context.read<LocaleCubit>().changeLanguage(
                                      AppLanguage.languageList().firstWhere(
                                        (lang) => lang.languageCode == 'ar',
                                      ),
                                    );
                              },
                            ),
                            Space.xf(.7),
                            customElevatedButton(
                              width: AppDimensions.normalize(60),
                              height: AppDimensions.normalize(20),
                              color: state.locale != const Locale('ar', 'EG')
                                  ? AppColors.deepRed
                                  : Colors.white,
                              borderRadius: AppDimensions.normalize(10),
                              textKey: "english",
                              textStyle: AppText.h3!.copyWith(
                                color: state.locale != const Locale('ar', 'EG')
                                    ? Colors.white
                                    : AppColors.blackish,
                              ),
                              onPressed: () {
                                context.read<LocaleCubit>().changeLanguage(
                                      AppLanguage.languageList().firstWhere(
                                        (lang) => lang.languageCode == 'en',
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          positionedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouter.onboarding);
            },
          )
        ],
      ),
    );
  }
}
