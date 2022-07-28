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
import 'package:wordly/domain/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setPathUrlStrategy();
  await setupServiceLocators();

  final spService = GetIt.I<SharedPreferencesService>();
  final isDarkTheme = await spService.getDark();
  final isHighContrast = await spService.getHighContrast();
  final dictionary = await spService.getDictionary();
  final locale = await spService.getLocale();

  final gameService = GetIt.I<GameService>();

  runZonedGuarded<void>(
    () {
      BlocOverrides.runZoned(
        () {
          runApp(
            MultiBlocProvider(
              providers: [
                BlocProvider<ThemeBloc>(
                  create: (_) => ThemeBloc(
                    spService: spService,
                    isDarkTheme: isDarkTheme,
                    isHighContrast: isHighContrast,
                  ),
                ),
                BlocProvider<DictionaryBloc>(
                  create: (_) => DictionaryBloc(
                    spService: spService,
                    dictionary: dictionary,
                  ),
                ),
                BlocProvider<LocaleBloc>(
                  create: (_) => LocaleBloc(
                    spService: spService,
                    locale: locale,
                  ),
                ),
                BlocProvider<GameBloc>(
                  create: (_) => GameBloc(
                    dictionary: dictionary,
                    gameService: gameService,
                  ),
                ),
              ],
              child: const App(),
            ),
          );
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
