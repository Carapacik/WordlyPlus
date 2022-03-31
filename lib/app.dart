import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/locale_languages.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/ui/pages/main/main_page.dart';
import 'package:wordly/utils/utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: RStringsDelegate.supportedLocales,
          localizationsDelegates: const [
            RStringsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: state.localeLanguage.locale,
          theme: state.isDark
              ? themes[AppTheme.darkTheme]
              : themes[AppTheme.lightTheme],
          home: const MainPage(),
        );
      },
    );
  }
}
