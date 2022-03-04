import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(
        App(),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
