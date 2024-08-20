import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_localezation/core/lang_enum.dart';
import 'package:test_localezation/generated/l10n.dart';
import 'package:test_localezation/logic/app_lang_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              S.of(context).choose,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade900,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                BlocProvider.of<AppLangCubit>(context)
                    .appChangeLang(LangType.arabicLang);
              },
              child: const Text(
                "اللغة العربية",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                BlocProvider.of<AppLangCubit>(context)
                    .appChangeLang(LangType.englishLang);
              },
              child: const Text(
                "English",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
