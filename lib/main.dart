import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordly/app.dart';
import 'package:wordly/bloc/dictionary/dictionary_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  await _setupServiceLocators();

  final prefs = await SharedPreferences.getInstance();
  final dictionary = prefs.getInt('dictionary') ?? 0;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DictionaryBloc>(
          create: (_) => DictionaryBloc(dictionary),
        ),
        BlocProvider<GameBloc>(
          create: (_) => GameBloc(dictionary),
        ),
      ],
      child: const App(),
    ),
  );
}

Future<void> _setupServiceLocators() async {
  await _initLocaleStorage();
}

Future<void> _initLocaleStorage() async {}
