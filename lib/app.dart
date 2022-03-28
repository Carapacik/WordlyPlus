import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordly/ui/pages/main/main_page.dart';
import 'package:wordly/utils/utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: RStringsDelegate.supportedLocales,
      localizationsDelegates: const [
        RStringsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // locale: getLocaleFromString(state.language),
      // theme: state.isDarkThemeOn
      //     ? themes[AppTheme.darkTheme]
      //     : themes[AppTheme.lightTheme],
      home: MainPage(),
    );
  }
}
