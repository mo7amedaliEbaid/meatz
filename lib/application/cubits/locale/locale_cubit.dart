import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/models/language.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(Locale initialLocale) : super(LocaleState(initialLocale));

  void changeLanguage(AppLanguage language) {
    Locale newLocale;
    switch (language.languageCode) {
      case "en":
        newLocale = Locale(language.languageCode, "US");
        break;
      case "ar":
        newLocale = Locale(language.languageCode, "EG");
        break;
      default:
        newLocale = state.locale;
    }
    emit(LocaleState(newLocale));
  }
}
