import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/app/data/dictionary_repository.dart';
import 'package:wordly/src/feature/app/data/locale_repository.dart';
import 'package:wordly/src/feature/app/data/theme_repository.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/level/data/level_repository.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  /// Shared preferences
  late final SharedPreferences sharedPreferences;

  late final ThemeRepository themeRepository;
  late final LocaleRepository localeRepository;
  late final DictionaryRepository dictionaryRepository;
  late final IStatisticsRepository statisticsRepository;
  late final ILevelRepository levelRepository;
  late final IGameRepository gameRepository;
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
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'stepCount: $stepCount, '
      'msSpent: $msSpent'
      ')';
}
