import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';
import 'package:wordle/data/data_singleton.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();
      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );
      await Firebase.initializeApp();
      final authRepository = AuthRepository();
      await authRepository.user.first;
      DictionaryInteractor.getInstance().createWord();
      HydratedBlocOverrides.runZoned(
        () => runApp(
          App(
          ),
        ),
        storage: storage,
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
