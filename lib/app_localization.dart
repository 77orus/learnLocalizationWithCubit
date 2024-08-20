import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  Locale? locale;
  AppLocalization({this.locale});

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String>? jsonStrings;

  static LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();

  Future loadLanguage() async {
    String langStrings =
        await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
    Map<String, dynamic> langMap = json.decode(langStrings);
    jsonStrings = langMap.map(
      (key, value) {
        return MapEntry(key, value.toString());
      },
    );
  }

  String translate(String key) => jsonStrings?[key] ?? "";
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale: locale);
    appLocalization.loadLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
