import 'package:flutter/widgets.dart';
import 'package:wordle/bloc/app/app_bloc.dart';
import 'package:wordle/presentation/home/home_page.dart';
import 'package:wordle/presentation/pages/login/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
