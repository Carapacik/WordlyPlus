import 'dart:async';
import 'dart:ui' show Locale;

import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/level/data/level_datasource.dart';

/// {@template statistic_repository}
/// Repository which manages the daily statistic.
/// {@endtemplate}
abstract interface class ILevelRepository {
  List<GameResult>? getLevels(Locale dictionary);

  Future<void> setLevels(Locale dictionary, GameResult levelInfo);
}

/// {@macro statistic_repository}
final class LevelRepositoryImpl implements ILevelRepository {
  /// {@macro statistic_repository}
  const LevelRepositoryImpl({required LevelDataSource levelDataSource}) : _levelDataSource = levelDataSource;

  final LevelDataSource _levelDataSource;

  @override
  Future<void> setLevels(Locale dictionary, GameResult levelInfo) async =>
      _levelDataSource.setLevels(dictionary.languageCode, levelInfo);

  @override
  List<GameResult>? getLevels(Locale dictionary) => _levelDataSource.getLevels(dictionary.languageCode);
}
