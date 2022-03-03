import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordle/app.dart';
import 'package:wordle/bloc/app/bloc_observer.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();
      final storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory(),
      );
      await Firebase.initializeApp();
      final authRepository = AuthRepository();
      await authRepository.user.first;
      HydratedBlocOverrides.runZoned(
        () => runApp(
          App(
            authRepository: authRepository,
          ),
        ),
        storage: storage,
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
