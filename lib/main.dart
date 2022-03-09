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
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setPathUrlStrategy();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      DictionaryData.getInstance().createSecretWord();
      await Firebase.initializeApp();
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
