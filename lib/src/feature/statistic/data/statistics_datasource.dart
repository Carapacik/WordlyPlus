import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/utils/persisted_entry.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

abstract interface class IStatisticsDatasource {
  Future<GameStatistics?> getStatistics(String dictionaryKey);

  Future<void> setStatistics(String dictionaryKey, GameStatistics statistics);
}

final class StatisticsDatasource implements IStatisticsDatasource {
  StatisticsDatasource({required this.sharedPreferences});

  final SharedPreferencesAsync sharedPreferences;

  StringPreferencesEntry _statistics(String dictionaryKey) =>
      StringPreferencesEntry(sharedPreferences: sharedPreferences, key: 'statistic.$dictionaryKey');

  @override
  Future<GameStatistics?> getStatistics(String dictionaryKey) async {
    final statistics = await _statistics(dictionaryKey).read();
    if (statistics == null) {
      return null;
    }

    return GameStatistics.fromJson(json.decode(statistics) as Map<String, dynamic>);
  }

  @override
  Future<void> setStatistics(String dictionaryKey, GameStatistics statistics) async {
    final rawStatistics = json.encode(statistics.toJson());
    await _statistics(dictionaryKey).set(rawStatistics);
  }
}
