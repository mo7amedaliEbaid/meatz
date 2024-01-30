class AppLanguage {
  final String name;
  final String flag;
  final String languageCode;

  AppLanguage(this.name, this.flag, this.languageCode);

  static List<AppLanguage> languageList() {
    return <AppLanguage>[
      AppLanguage("English", "US", "en"),
      AppLanguage("Arabic", 'EG', "ar"),
    ];
  }
}