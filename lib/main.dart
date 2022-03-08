import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';
import 'package:wordle/data/dictionary_data.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setPathUrlStrategy();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      DictionaryData.getInstance().createSecretWord();
      await Firebase.initializeApp();
      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );
      HydratedBlocOverrides.runZoned(
        () => runApp(
          const App(),
        ),
        storage: storage,
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
