import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/settings_data.dart';
import 'package:wordle/data/repositories/settings_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAhcjNRAWE9i4xvHnGX_dP8Qsexj2Gbv8A",
      appId: "1:1035703108304:web:97b9de3b33f647abcd14d5",
      messagingSenderId: "1035703108304",
      projectId: "wordle-60cbd",
      authDomain: "wordle-60cbd.firebaseapp.com",
      storageBucket: "wordle-60cbd.appspot.com",
      measurementId: "G-N9J8MD287F",
    ),
  );
  return BlocOverrides.runZoned(
    () async {
      DictionaryData.getInstance().createSecretWord();
      final settingsData = await SettingsRepository.getInstance().getItem();
      runApp(
        BlocProvider<SettingsCubit>(
          create: (_) =>
              SettingsCubit(item: settingsData ?? const SettingsData()),
          child: const App(),
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
