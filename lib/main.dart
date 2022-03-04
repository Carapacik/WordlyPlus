import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';
import 'package:wordle/data/dictionary_interactor.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();
      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );
      await Firebase.initializeApp();
      DictionaryInteractor.getInstance().createWord();
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
