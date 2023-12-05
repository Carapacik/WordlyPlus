import 'dart:async';
import 'dart:convert' show json;
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
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

  /// Run migration from old api
  Future<void> runMigration();
}

/// {@macro Level_datasource}
final class LevelDataSourceImpl implements LevelDataSource {
  /// {@macro Level_datasource}
  const LevelDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _prefix = 'level';
  static const _migrationVersionPrefix = 'level_migration_version';

  @override
  List<GameResult>? loadLevelFromCache(String dictionaryKey) {
    final levels = _sharedPreferences.getStringList('${_prefix}_$dictionaryKey');
    if (levels == null) {
      return null;
    }
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

  @override
  Future<void> runMigration() async {
    final migrationVersion = _sharedPreferences.getInt(_migrationVersionPrefix);
    if (migrationVersion == null || migrationVersion < 1) {
      return;
    }
    const dictionaries = [
      Locale('en'),
      Locale('ru'),
    ];
    for (final dictionary in dictionaries) {
      try {
        final key = '${_prefix}_${dictionary.languageCode}';
        final levels = _sharedPreferences.getStringList(key);
        if (levels == null || levels.isEmpty) {
          continue;
        }
        // detect old api
        final decodedFirst = json.decode(levels.first) as Map<String, dynamic>;
        if (!decodedFirst.containsKey('word') || !decodedFirst.containsKey('isWin')) {
          continue;
        }
        await _sharedPreferences.setStringList(key, []);
        final newLevels = levels.mapIndexed((index, e) {
          final decoded = json.decode(e) as Map<String, dynamic>;
          return GameResult(
            secretWord: decoded['word'].toString(),
            isWin: decoded['isWin'] as bool?,
            lvlNumber: index + 1,
          );
        });
        await _sharedPreferences.setStringList(key, newLevels.map((e) => json.encode(e.toJson())).toList());
      } on Object {
        // for new api
      }
    }
    await _sharedPreferences.setInt(_migrationVersionPrefix, 1);
  }
}
