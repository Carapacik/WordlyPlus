import 'dart:async';
import 'dart:convert' show json;
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/utils/persisted_entry.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';

abstract interface class ILevelDatasource {
  Future<List<GameResult>?> getLevels(String dictionaryKey);

  Future<void> setLevel(String dictionaryKey, GameResult level);

  Future<void> runMigration();
}

final class LevelDatasource implements ILevelDatasource {
  LevelDatasource({required this.sharedPreferences});

  final SharedPreferencesAsync sharedPreferences;

  StringListPreferencesEntry _levels(String dictionaryKey) =>
      StringListPreferencesEntry(sharedPreferences: sharedPreferences, key: 'level.$dictionaryKey');

  IntPreferencesEntry get _levelsMigrationVersion =>
      IntPreferencesEntry(sharedPreferences: sharedPreferences, key: 'level.migration.version');

  @override
  Future<List<GameResult>?> getLevels(String dictionaryKey) async {
    final levels = await _levels(dictionaryKey).read();
    if (levels == null) {
      return null;
    }
    try {
      return levels.map((l) => GameResult.fromJson(json.decode(l) as Map<String, dynamic>)).toList();
    } on Object catch (_) {
      unawaited(_levels(dictionaryKey).remove());
      return null;
    }
  }

  @override
  Future<void> setLevel(String dictionaryKey, GameResult level) async {
    final previousLevels = (await getLevels(dictionaryKey) ?? [])..add(level);
    final rawLevels = previousLevels.map((rawItem) => json.encode(rawItem.toJson())).toList(growable: false);
    await _levels(dictionaryKey).set(rawLevels);
  }

  @override
  Future<void> runMigration() async {
    final migrationVersion = await _levelsMigrationVersion.read();
    if (migrationVersion == null || migrationVersion < 1) {
      return;
    }
    const dictionaries = [Locale('en'), Locale('ru')];
    for (final dictionary in dictionaries) {
      try {
        final levels = await _levels(dictionary.languageCode).read();
        if (levels == null || levels.isEmpty) {
          continue;
        }
        // detect old api
        final decodedFirst = json.decode(levels.first) as Map<String, dynamic>;
        if (!decodedFirst.containsKey('word') || !decodedFirst.containsKey('isWin')) {
          continue;
        }
        await _levels(dictionary.languageCode).remove();
        final newLevels = levels.mapIndexed((index, e) {
          final decoded = json.decode(e) as Map<String, dynamic>;
          return GameResult(
            secretWord: decoded['word'].toString(),
            isWin: decoded['isWin'] as bool?,
            lvlNumber: index + 1,
          );
        });
        await _levels(
          dictionary.languageCode,
        ).set(newLevels.map((e) => json.encode(e.toJson())).toList(growable: false));
      } on Object {
        // nothing
      }
    }
    await _levelsMigrationVersion.set(1);
  }
}
