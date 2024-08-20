import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_localezation/cache/chahe_helper.dart';
import 'package:test_localezation/core/lang_enum.dart';
import 'package:test_localezation/logic/app_lang_state.dart';

class AppLangCubit extends Cubit<AppLangState> {
  AppLangCubit() : super(AppLangInitial());

  appChangeLang(LangType langType) {
    switch (langType) {
      case LangType.intialLang:
        if (ChacheHelper.getData(key: "lang") != null) {
          if (ChacheHelper.getData(key: "lang") == "en") {
            emit(AppChangeLang(lang: "en"));
          } else {
            emit(AppChangeLang(lang: "ar"));
          }
        }
        break;
      case LangType.arabicLang:
        ChacheHelper.saveData(key: "lang", value: "ar");
        emit(AppChangeLang(lang: "ar"));

        break;
      case LangType.englishLang:
        ChacheHelper.saveData(key: "lang", value: "en");
        emit(AppChangeLang(lang: "en"));
    }
  }
}
