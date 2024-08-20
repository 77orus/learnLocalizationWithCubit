import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_localezation/cache/chahe_helper.dart';
import 'package:test_localezation/core/lang_enum.dart';
import 'package:test_localezation/generated/l10n.dart';
import 'package:test_localezation/home_Screen.dart';
import 'package:test_localezation/logic/app_lang_cubit.dart';
import 'package:test_localezation/logic/app_lang_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLangCubit()..appChangeLang(LangType.intialLang),
      child: BlocBuilder<AppLangCubit, AppLangState>(
        builder: (context, state) {
          if (state is AppChangeLang) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(state.lang!),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: const HomeScreen(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: const Locale("en"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

Locale localCallBack(Locale? local, Iterable<Locale> supportedLocales) {
  if (local == null) {
    return supportedLocales.last;
  }

  for (var deviceLocal in supportedLocales) {
    if (local.languageCode == deviceLocal.languageCode) {
      return deviceLocal;
    }
  }

  return supportedLocales.last;
}
