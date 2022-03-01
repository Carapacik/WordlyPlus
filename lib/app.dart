import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle/presentation/pages/main/main_page.dart';
import 'package:wordle/utils/platform.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformType.isCupertino()) {
      return CupertinoApp();
    } else if (PlatformType.isFluent()) {
      return FluentApp();
    }
    return MaterialApp(
      home: MainPage(),
    );
  }
}
