import 'dart:async';
import 'dart:convert' show json;
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
import 'package:wordly/src/core/utils/preferences_dao.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';

/// {@template level_datasource}
/// [LevelDataSource] is an entry point to the level data layer.
///
/// This is used to set and get level.
/// {@endtemplate}
abstract interface class LevelDataSource {
  /// Set level
  Future<void> setLevels(String dictionaryKey, GameResult levels);

  /// Get current level from cache
  List<GameResult>? getLevels(String dictionaryKey);

  /// Run migration from old api
  Future<void> runMigration();
}

/// {@macro Level_datasource}
final class LevelDataSourceLocal extends PreferencesDao implements LevelDataSource {
  /// {@macro Level_datasource}
  const LevelDataSourceLocal({
    required super.sharedPreferences,
  });

  PreferencesEntry<Iterable<String>> _level(String dictionaryKey) => iterableStringEntry('level$dictionaryKey');

  PreferencesEntry<int> get _migrationVersion => intEntry('level_migration_version');

  @override
  List<GameResult>? getLevels(String dictionaryKey) {
    final levels = _level(dictionaryKey).read();
    if (levels == null) {
      return null;
    }
    try {
      return levels.map((l) => GameResult.fromJson(json.decode(l) as Map<String, dynamic>)).toList();
    } on Object catch (_) {
      unawaited(_level(dictionaryKey).remove());
      return null;
    }
  }

  @override
  Future<void> setLevels(String dictionaryKey, GameResult level) async {
    final previousLevels = (getLevels(dictionaryKey) ?? [])..add(level);
    final rawLevels = previousLevels.map((rawItem) => json.encode(rawItem.toJson()));
    await _level(dictionaryKey).setIfNullRemove(rawLevels);
  }

  @override
  Future<void> runMigration() async {
    final migrationVersion = _migrationVersion.read();
    if (migrationVersion == null || migrationVersion < 1) {
      return;
    }
    const dictionaries = [
      Locale('en'),
      Locale('ru'),
    ];
    for (final dictionary in dictionaries) {
      try {
        final levels = _level(dictionary.languageCode).read();
        if (levels == null || levels.isEmpty) {
          continue;
        }
        // detect old api
        final decodedFirst = json.decode(levels.first) as Map<String, dynamic>;
        if (!decodedFirst.containsKey('word') || !decodedFirst.containsKey('isWin')) {
          continue;
        }
        await _level(dictionary.languageCode).remove();
        final newLevels = levels.mapIndexed((index, e) {
          final decoded = json.decode(e) as Map<String, dynamic>;
          return GameResult(
            secretWord: decoded['word'].toString(),
            isWin: decoded['isWin'] as bool?,
            lvlNumber: index + 1,
          );
        });
        await _level(dictionary.languageCode).setIfNullRemove(newLevels.map((e) => json.encode(e.toJson())));
      } on Object {
        // for new api
      }
    }
    await _migrationVersion.setIfNullRemove(1);
  }
}
