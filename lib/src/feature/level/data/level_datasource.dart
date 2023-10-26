import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';

/// {@template Level_datasource}
/// [LevelDataSource] is an entry point to the Level data layer.
///
/// This is used to set and get Level.
/// {@endtemplate}
abstract interface class LevelDataSource {
  /// Set Level
  Future<void> saveLevels(String dictionaryKey, GameResult levels);

  /// Get current Level from cache
  List<GameResult>? loadLevelFromCache(String dictionaryKey);
}

/// {@macro Level_datasource}
final class LevelDataSourceImpl implements LevelDataSource {
  /// {@macro Level_datasource}
  const LevelDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _prefix = 'level';

  @override
  List<GameResult>? loadLevelFromCache(String dictionaryKey) {
    final levels = _sharedPreferences.getStringList('${_prefix}_$dictionaryKey');

    if (levels == null) {
      return null;
    }
    // for old version
    try {
      return levels.map((l) => GameResult.fromJson(json.decode(l) as Map<String, dynamic>)).toList();
    } on Object catch (_) {
      unawaited(_sharedPreferences.setStringList('${_prefix}_$dictionaryKey', []));
      return null;
    }
  }

  @override
  Future<void> saveLevels(String dictionaryKey, GameResult level) async {
    final previousLevels = (loadLevelFromCache(dictionaryKey) ?? [])..add(level);
    final rawLevels = previousLevels.map((rawItem) => json.encode(rawItem.toJson())).toList();
    await _sharedPreferences.setStringList('${_prefix}_$dictionaryKey', rawLevels);
  }
}
