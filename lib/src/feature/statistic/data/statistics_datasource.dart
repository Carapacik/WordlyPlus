import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

/// {@template Statistics_datasource}
/// [StatisticsDataSource] is an entry point to the Statistics data layer.
///
/// This is used to set and get Statistics.
/// {@endtemplate}
abstract interface class StatisticsDataSource {
  /// Set Statistics
  Future<void> saveStatistics(String dictionaryKey, GameStatistics statistics);

  /// Get current Statistics from cache
  GameStatistics? loadStatisticsFromCache(String dictionaryKey);
}

/// {@macro Statistics_datasource}
final class StatisticsDataSourceImpl implements StatisticsDataSource {
  /// {@macro Statistics_datasource}
  const StatisticsDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _prefix = 'statistics';

  @override
  GameStatistics? loadStatisticsFromCache(String dictionaryKey) {
    final statistics = _sharedPreferences.getString('${_prefix}_$dictionaryKey');

    if (statistics == null) {
      return null;
    }

    return GameStatistics.fromJson(json.decode(statistics) as Map<String, dynamic>);
  }

  @override
  Future<void> saveStatistics(String dictionaryKey, GameStatistics statistics) async {
    final raw = json.encode(statistics.toJson());
    await _sharedPreferences.setString('${_prefix}_$dictionaryKey', raw);
  }
}
