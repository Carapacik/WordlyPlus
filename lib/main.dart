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
import 'package:wordly/domain/game_service.dart';
import 'package:wordly/domain/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setPathUrlStrategy();
  await setupServiceLocators();

  final settingsService = GetIt.I<SaveSettingsService>();
  final isDarkTheme = await settingsService.getDark();
  final isHighContrast = await settingsService.getHighContrast();
  final dictionary = await settingsService.getDictionary();
  final locale = await settingsService.getLocale();
  final isFirstLaunch = await settingsService.isFirstLaunch();

  final gameService = GetIt.I<SaveGameService>();

  runZonedGuarded<void>(
    () {
      BlocOverrides.runZoned(
        () {
          runApp(
            MultiBlocProvider(
              providers: [
                BlocProvider<ThemeBloc>(
                  create: (_) => ThemeBloc(
                    settingsService: settingsService,
                    isDarkTheme: isDarkTheme,
                    isHighContrast: isHighContrast,
                  ),
                ),
                BlocProvider<DictionaryBloc>(
                  create: (_) => DictionaryBloc(
                    settingsService: settingsService,
                    dictionary: dictionary,
                  ),
                ),
                BlocProvider<LocaleBloc>(
                  create: (_) => LocaleBloc(
                    settingsService: settingsService,
                    locale: locale,
                  ),
                ),
                BlocProvider<GameBloc>(
                  create: (_) => GameBloc(
                    gameService: gameService,
                    dictionary: dictionary,
                  ),
                ),
              ],
              child: App(isFirstLaunch: isFirstLaunch),
            ),
          );
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
