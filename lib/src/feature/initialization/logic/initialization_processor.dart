import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/constant/config.dart';
import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/initialization/model/dependencies.dart';
import 'package:wordly/src/feature/level/data/level_datasource.dart';
import 'package:wordly/src/feature/level/data/level_repository.dart';
import 'package:wordly/src/feature/settings/bloc/settings_bloc.dart';
import 'package:wordly/src/feature/settings/data/color_mode_codec.dart';
import 'package:wordly/src/feature/settings/data/dictionary_datasource.dart';
import 'package:wordly/src/feature/settings/data/dictionary_repository.dart';
import 'package:wordly/src/feature/settings/data/locale_datasource.dart';
import 'package:wordly/src/feature/settings/data/locale_repository.dart';
import 'package:wordly/src/feature/settings/data/theme_datasource.dart';
import 'package:wordly/src/feature/settings/data/theme_mode_codec.dart';
import 'package:wordly/src/feature/settings/data/theme_repository.dart';
import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

/// {@template initialization_processor}
/// A class which is responsible for processing initialization steps.
/// {@endtemplate}
final class InitializationProcessor {
  /// {@macro initialization_processor}
  const InitializationProcessor(this.config);

  /// Application configuration
  final Config config;

  Future<Dependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    final settingsBloc = await _initSettingsBloc(sharedPreferences);

    final gameRepository = GameRepository(
      gameDataSource: GameDataSourceLocal(sharedPreferences: sharedPreferences),
    );
    await gameRepository.init();

    final levelDataSource = LevelDataSourceLocal(sharedPreferences: sharedPreferences);
    await levelDataSource.runMigration();
    final levelRepository = LevelRepositoryImpl(levelDataSource: levelDataSource);

    final statisticsRepository =
        StatisticsRepositoryImpl(statisticsDataSource: StatisticsDataSourceLocal(sharedPreferences: sharedPreferences));

    return Dependencies(
      sharedPreferences: sharedPreferences,
      settingsBloc: settingsBloc,
      gameRepository: gameRepository,
      levelRepository: levelRepository,
      statisticsRepository: statisticsRepository,
    );
  }

  Future<SettingsBloc> _initSettingsBloc(SharedPreferences prefs) async {
    final localeRepository = LocaleRepositoryImpl(
      localeDataSource: LocaleDataSourceLocal(sharedPreferences: prefs),
    );

    final dictionaryRepository = DictionaryRepositoryImpl(
      dictionaryDataSource: DictionaryDataSourceLocal(sharedPreferences: prefs),
    );

    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        themeModeCodec: const ThemeModeCodec(),
        colorModeCodec: const ColorModeCodec(),
      ),
    );

    final theme = await themeRepository.getTheme();
    final locale = await localeRepository.getLocale();
    final dictionary = await dictionaryRepository.getDictionary();

    final initialState = SettingsState.idle(appTheme: theme, locale: locale, dictionary: dictionary);

    final settingsBloc = SettingsBloc(
      localeRepository: localeRepository,
      dictionaryRepository: dictionaryRepository,
      themeRepository: themeRepository,
      initialState: initialState,
    );
    return settingsBloc;
  }

  /// Initializes dependencies and returns the result of the initialization.
  ///
  /// This method may contain additional steps that need initialization
  /// before the application starts
  /// (for example, caching or enabling tracking manager)
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
