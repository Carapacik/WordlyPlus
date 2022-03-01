import 'package:flutter/material.dart';
import 'package:wordle/presentation/pages/main/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(),);
  }
}
