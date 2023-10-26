import 'dart:async';
import 'dart:ui' show Locale;

import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/level/data/level_datasource.dart';

/// {@template statistic_repository}
/// Repository which manages the daily statistic.
/// {@endtemplate}
abstract interface class ILevelRepository {
  List<GameResult>? loadLevelFromCache(Locale dictionary);

  Future<void> saveLevels(Locale dictionary, GameResult levelInfo);
}

/// {@macro statistic_repository}
final class LevelRepositoryImpl implements ILevelRepository {
  /// {@macro statistic_repository}
  const LevelRepositoryImpl(this._dataSource);

  final LevelDataSource _dataSource;

  @override
  Future<void> saveLevels(Locale dictionary, GameResult levelInfo) async =>
      _dataSource.saveLevels(dictionary.languageCode, levelInfo);

  @override
  List<GameResult>? loadLevelFromCache(Locale dictionary) => _dataSource.loadLevelFromCache(dictionary.languageCode);
}
