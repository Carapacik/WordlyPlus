import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/app/data/dictionary_repository.dart';
import 'package:wordly/src/feature/app/data/locale_repository.dart';
import 'package:wordly/src/feature/app/data/theme_repository.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
abstract base class Dependencies {
  /// {@macro dependencies}
  const Dependencies();

  /// Shared preferences
  abstract final SharedPreferences sharedPreferences;

  /// Theme repository
  abstract final ThemeRepository themeRepository;

  /// Locale repository
  abstract final LocaleRepository localeRepository;

  /// Dictionary repository
  abstract final DictionaryRepository dictionaryRepository;

  /// Dictionary repository
  abstract final IStatisticsRepository statisticsRepository;

  /// Dictionary repository
  abstract final IGameRepository gameRepository;

  /// Freeze dependencies, so they cannot be modified
  Dependencies freeze();
}

/// {@template mutable_dependencies}
/// Mutable version of dependencies
///
/// Used to build dependencies
/// {@endtemplate}
final class DependenciesMutable extends Dependencies {
  /// {@macro mutable_dependencies}
  DependenciesMutable();

  @override
  late SharedPreferences sharedPreferences;

  @override
  late ThemeRepository themeRepository;

  @override
  late LocaleRepository localeRepository;

  @override
  late DictionaryRepository dictionaryRepository;

  @override
  late IStatisticsRepository statisticsRepository;

  @override
  late IGameRepository gameRepository;

  @override
  Dependencies freeze() => _DependenciesImmutable(
        sharedPreferences: sharedPreferences,
        themeRepository: themeRepository,
        localeRepository: localeRepository,
        dictionaryRepository: dictionaryRepository,
        statisticsRepository: statisticsRepository,
        gameRepository: gameRepository,
      );
}

/// {@template immutable_dependencies}
/// Immutable version of dependencies
///
/// Used to store dependencies
/// {@endtemplate}
final class _DependenciesImmutable extends Dependencies {
  /// {@macro immutable_dependencies}
  const _DependenciesImmutable({
    required this.sharedPreferences,
    required this.themeRepository,
    required this.localeRepository,
    required this.dictionaryRepository,
    required this.statisticsRepository,
    required this.gameRepository,
  });

  @override
  final SharedPreferences sharedPreferences;

  @override
  final ThemeRepository themeRepository;

  @override
  final LocaleRepository localeRepository;

  @override
  Dependencies freeze() => this;

  @override
  final DictionaryRepository dictionaryRepository;

  @override
  final IStatisticsRepository statisticsRepository;

  @override
  final IGameRepository gameRepository;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.stepCount,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of steps
  final int stepCount;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => 'InitializationResult('
      'dependencies: $dependencies, '
      'stepCount: $stepCount, '
      'msSpent: $msSpent'
      ')';
}
