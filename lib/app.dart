import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordly/presentation/pages/game/game_page.dart';
import 'package:wordly/resources/resources.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        R.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: R.delegate.supportedLocales,
      onGenerateTitle: (context) => context.r.wordly_title,
      home: const GamePage(),
    );
  }
}
