import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/initialization/model/dependencies.dart';
import 'package:wordly/src/feature/initialization/model/initialization_progress.dart';
import 'package:wordly/src/feature/level/data/level_datasource.dart';
import 'package:wordly/src/feature/level/data/level_repository.dart';
import 'package:wordly/src/feature/settings/data/color_mode_codec.dart';
import 'package:wordly/src/feature/settings/data/dictionary_datasource.dart';
import 'package:wordly/src/feature/settings/data/locale_datasource.dart';
import 'package:wordly/src/feature/settings/data/settings_repository.dart';
import 'package:wordly/src/feature/settings/data/theme_datasource.dart';
import 'package:wordly/src/feature/settings/data/theme_mode_codec.dart';
import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

/// A function which represents a single initialization step.
typedef StepAction = FutureOr<void>? Function(InitializationProgress progress);

/// The initialization steps, which are executed in the order they are defined.
///
/// The [Dependencies] object is passed to each step, which allows the step to
/// set the dependency, and the next step to use it.
mixin InitializationSteps {
  /// The initialization steps,
  /// which are executed in the order they are defined.
  final initializationSteps = <String, StepAction>{
    'Shared Preferences': (progress) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      progress.dependencies.sharedPreferences = sharedPreferences;
    },
    'Settings Repository': (progress) async {
      final sharedPreferences = progress.dependencies.sharedPreferences;
      final themeDataSource = ThemeDataSourceImpl(
        sharedPreferences: sharedPreferences,
        themeModeCodec: const ThemeModeCodec(),
        colorModeCodec: const ColorModeCodec(),
      );
      final localeDataSource = LocaleDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      final dictionaryDataSource = DictionaryDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      progress.dependencies.settingsRepository = SettingsRepositoryImpl(
        themeDataSource: themeDataSource,
        dictionaryDataSource: dictionaryDataSource,
        localeDataSource: localeDataSource,
      );
    },
    'Statistics Repository': (progress) async {
      final sharedPreferences = progress.dependencies.sharedPreferences;
      final statisticsDataSource = StatisticsDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      await statisticsDataSource.runMigration();
      progress.dependencies.statisticsRepository = StatisticsRepositoryImpl(
        statisticsDataSource,
      );
    },
    'Level Repository': (progress) async {
      final sharedPreferences = progress.dependencies.sharedPreferences;
      final lvlDataSource = LevelDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      await lvlDataSource.runMigration();
      progress.dependencies.levelRepository = LevelRepositoryImpl(
        lvlDataSource,
      );
    },
    'Game Repository': (progress) async {
      final sharedPreferences = progress.dependencies.sharedPreferences;
      final gameDataSource = GameDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      final gameRepository = GameRepository(gameDataSource: gameDataSource);
      await gameRepository.init();
      progress.dependencies.gameRepository = gameRepository;
    },
  };
}
