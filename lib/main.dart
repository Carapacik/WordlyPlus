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
import 'package:wordly/domain/save_game_service.dart';
import 'package:wordly/domain/save_levels_service.dart';
import 'package:wordly/domain/save_settings_service.dart';
import 'package:wordly/domain/save_statistic_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setPathUrlStrategy();
  await setupServiceLocators();

  final settingsService = GetIt.I<ISaveSettingsService>();
  final isDarkTheme = await settingsService.getDark();
  final isHighContrast = await settingsService.getHighContrast();
  final dictionary = await settingsService.getDictionary();
  final locale = await settingsService.getLocale();
  final isSecondLaunch = await settingsService.isSecondLaunch();

  final gameService = GetIt.I<ISaveGameService>();
  final statService = GetIt.I<ISaveStatisticService>();
  final lvlService = GetIt.I<ISaveLevelsService>();

  runZonedGuarded<void>(
    () {
      BlocOverrides.runZoned(
        () {
          runApp(
            MultiBlocProvider(
              providers: [
                BlocProvider<ThemeBloc>(
                  create: (_) => ThemeBloc(
                    saveSettingsService: settingsService,
                    isDarkTheme: isDarkTheme,
                    isHighContrast: isHighContrast,
                  ),
                ),
                BlocProvider<DictionaryBloc>(
                  create: (_) => DictionaryBloc(
                    saveSettingsService: settingsService,
                    dictionary: dictionary,
                  ),
                ),
                BlocProvider<LocaleBloc>(
                  create: (_) => LocaleBloc(
                    saveSettingsService: settingsService,
                    locale: locale,
                  ),
                ),
                BlocProvider<GameBloc>(
                  create: (_) => GameBloc(
                    saveGameService: gameService,
                    saveStatisticService: statService,
                    saveLevelsService: lvlService,
                    dictionary: dictionary,
                  )..add(const GameEvent.loadGame()),
                ),
              ],
              child: App(isSecondLaunch: isSecondLaunch),
            ),
          );
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
