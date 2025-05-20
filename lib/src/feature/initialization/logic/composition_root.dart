import 'dart:ui' show Locale;

import 'package:clock/clock.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/constant/application_config.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/initialization/model/dependencies_container.dart';
import 'package:wordly/src/feature/level/data/level_datasource.dart';
import 'package:wordly/src/feature/level/data/level_repository.dart';
import 'package:wordly/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:wordly/src/feature/settings/data/app_settings_datasource.dart';
import 'package:wordly/src/feature/settings/data/app_settings_repository.dart';
import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

/// {@template composition_root}
/// A place where Application-Wide dependencies are initialized.
///
/// Application-Wide dependencies are dependencies that have a global scope,
/// used in the entire application and have a lifetime that is the same as the application.
/// {@endtemplate}
///
/// {@template composition_process}
/// Composition of dependencies is a process of creating and configuring
/// instances of classes that are required for the application to work.
/// {@endtemplate}
/// Composes dependencies and returns the result of composition.
Future<CompositionResult> composeDependencies({required ApplicationConfig config, required Logger logger}) async {
  final stopwatch = clock.stopwatch()..start();

  logger.info('Initializing dependencies...');

  // Create the dependencies container using functions.
  final dependencies = await createDependenciesContainer(config, logger);

  stopwatch.stop();
  logger.info('Dependencies initialized successfully in ${stopwatch.elapsedMilliseconds} ms.');

  return CompositionResult(dependencies: dependencies, millisecondsSpent: stopwatch.elapsedMilliseconds);
}

/// {@template composition_result}
/// Result of composition.
///
/// {@macro composition_process}
/// {@endtemplate}
final class CompositionResult {
  /// {@macro composition_result}
  const CompositionResult({required this.dependencies, required this.millisecondsSpent});

  /// The dependencies container.
  final DependenciesContainer dependencies;

  /// The number of milliseconds spent composing dependencies.
  final int millisecondsSpent;

  @override
  String toString() =>
      'CompositionResult('
      'dependencies: $dependencies, '
      'millisecondsSpent: $millisecondsSpent'
      ')';
}

/// Creates the full dependencies container.
Future<DependenciesContainer> createDependenciesContainer(ApplicationConfig config, Logger logger) async {
  // Create or obtain the shared preferences instance.
  final sharedPreferences = SharedPreferencesAsync();

  // Get package info.
  final packageInfo = await PackageInfo.fromPlatform();

  // Create the AppSettingsBloc using shared preferences.
  final appSettingsBloc = await createAppSettingsBloc(sharedPreferences);

  final gameRepository = GameRepository(gameDataSource: GameDatasource(sharedPreferences: sharedPreferences));
  await gameRepository.init(appSettingsBloc.state.appSettings?.dictionary ?? const Locale('en'));

  final ILevelDatasource levelDataSource = LevelDatasource(sharedPreferences: sharedPreferences);
  await levelDataSource.runMigration();
  final levelRepository = LevelRepository(levelDataSource: levelDataSource);

  final IStatisticsRepository statisticsRepository = StatisticsRepository(
    statisticsDatasource: StatisticsDatasource(sharedPreferences: sharedPreferences),
  );

  return DependenciesContainer(
    logger: logger,
    config: config,
    packageInfo: packageInfo,
    appSettingsBloc: appSettingsBloc,
    gameRepository: gameRepository,
    levelRepository: levelRepository,
    statisticsRepository: statisticsRepository,
  );
}

/// Creates an instance of [Logger] and attaches any provided observers.
Logger createAppLogger({List<LogObserver> observers = const []}) {
  final logger = Logger();

  for (final observer in observers) {
    logger.addObserver(observer);
  }

  return logger;
}

/// Creates an instance of [AppSettingsBloc].
///
/// The [AppSettingsBloc] is initialized at startup to load the app settings from local storage.
Future<AppSettingsBloc> createAppSettingsBloc(SharedPreferencesAsync sharedPreferences) async {
  final appSettingsRepository = AppSettingsRepositoryImpl(
    datasource: AppSettingsDatasourceImpl(sharedPreferences: sharedPreferences),
  );

  final appSettings = await appSettingsRepository.getAppSettings();
  final initialState = AppSettingsState.idle(appSettings: appSettings);

  return AppSettingsBloc(appSettingsRepository: appSettingsRepository, initialState: initialState);
}
