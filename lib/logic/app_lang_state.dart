class AppLangState {}

class AppLangInitial extends AppLangState {}

class AppChangeLang extends AppLangState {
  final String? lang;

  AppChangeLang({this.lang});
}
