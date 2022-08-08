import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordly/app/app.dart';
import 'package:wordly/app/observer.dart';
import 'package:wordly/app/service_locator.dart';
import 'package:wordly/bloc/dictionary/dictionary_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/bloc/locale/locale_bloc.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/data/repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setPathUrlStrategy();
  await setupServiceLocators();

  runZonedGuarded<void>(
    () async {
      Bloc.observer = AppBlocObserver();
      final gameRepo = GetIt.I<ISaveGameRepository>();
      final statisticRepo = GetIt.I<ISaveStatisticRepository>();
      final levelsRepo = GetIt.I<ISaveLevelsRepository>();
      final settingsRepo = GetIt.I<ISaveSettingsRepository>();

      final isDarkTheme = await settingsRepo.getDark();
      final isHighContrast = await settingsRepo.getHighContrast();
      final dictionary = await settingsRepo.getDictionary();
      final locale = await settingsRepo.getLocale();
      final isSecondLaunch = await settingsRepo.isSecondLaunch();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (_) => ThemeBloc(
                settingsRepository: settingsRepo,
                isDarkTheme: isDarkTheme,
                isHighContrast: isHighContrast,
              ),
            ),
            BlocProvider<DictionaryBloc>(
              create: (_) => DictionaryBloc(
                settingsRepository: settingsRepo,
                dictionary: dictionary,
              ),
            ),
            BlocProvider<LocaleBloc>(
              create: (_) => LocaleBloc(
                settingsRepository: settingsRepo,
                locale: locale,
              ),
            ),
            BlocProvider<GameBloc>(
              create: (_) => GameBloc(
                gameRepository: gameRepo,
                statisticRepository: statisticRepo,
                levelsRepository: levelsRepo,
                dictionary: dictionary,
              )..add(const GameEvent.loadGame()),
            ),
          ],
          child: App(isSecondLaunch: isSecondLaunch),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
