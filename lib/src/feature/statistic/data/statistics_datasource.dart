import 'dart:convert';

import 'package:wordly/src/core/utils/preferences_dao.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

abstract interface class StatisticsDataSource {
  /// Set [GameStatistics]
  Future<void> setStatistics(String dictionaryKey, GameStatistics statistics);

  /// Get current [GameStatistics] from cache
  GameStatistics? getStatistics(String dictionaryKey);
}

/// {@macro Statistics_datasource}
final class StatisticsDataSourceLocal extends PreferencesDao implements StatisticsDataSource {
  /// {@macro Statistics_datasource}
  const StatisticsDataSourceLocal({
    required super.sharedPreferences,
  });

  PreferencesEntry<String> _statistic(String dictionaryKey) => stringEntry('statistic_$dictionaryKey');

  @override
  GameStatistics? getStatistics(String dictionaryKey) {
    final statistics = _statistic(dictionaryKey).read();

    if (statistics == null) {
      return null;
    }

    return GameStatistics.fromJson(json.decode(statistics) as Map<String, dynamic>);
  }

  @override
  Future<void> setStatistics(String dictionaryKey, GameStatistics statistics) async {
    final rawStatistics = json.encode(statistics.toJson());
    await _statistic(dictionaryKey).setIfNullRemove(rawStatistics);
  }
}
