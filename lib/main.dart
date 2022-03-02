import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
