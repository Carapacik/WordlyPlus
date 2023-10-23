import 'dart:async';
import 'dart:ui' show Locale;

import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

/// {@template statistic_repository}
/// Repository which manages the daily statistic.
/// {@endtemplate}
abstract interface class IStatisticsRepository {
  /// Set statistic
  Future<void> saveStatistic(
    Locale dictionary, {
    required bool isWin,
    required int attempt,
  });

  /// Observe current statistic changes
  GameStatistics? loadAppStatisticFromCache(Locale dictionary);
}

/// {@macro statistic_repository}
final class StatisticsRepositoryImpl implements IStatisticsRepository {
  /// {@macro statistic_repository}
  const StatisticsRepositoryImpl(this._dataSource);

  final StatisticsDataSource _dataSource;

  @override
  Future<void> saveStatistic(
    Locale dictionary, {
    required bool isWin,
    required int attempt,
  }) async {
    final previousStatistic = _dataSource.loadStatisticsFromCache(dictionary.languageCode);
    final currentStatistic = GameStatistics(
      loses: _calculateLoses(isWin: isWin, previous: previousStatistic?.loses),
      wins: _calculateWins(isWin: isWin, previous: previousStatistic?.wins),
      streak: _calculateStreak(isWin: isWin, previous: previousStatistic?.streak),
      maxStreak: _calculateMaxStreak(
        isWin: isWin,
        previous: previousStatistic?.maxStreak,
      ),
      attempts: _calculateAttempts(
        attempt: isWin ? attempt - 1 : -1,
        previous: previousStatistic?.attempts,
      ),
    );
    await _dataSource.saveStatistics(dictionary.languageCode, currentStatistic);
  }

  @override
  GameStatistics? loadAppStatisticFromCache(Locale dictionary) =>
      _dataSource.loadStatisticsFromCache(dictionary.languageCode);

  int _calculateLoses({required bool isWin, required int? previous}) {
    if (isWin) {
      return previous ?? 0;
    }
    if (previous == null) {
      return 1;
    }
    return previous + 1;
  }

  int _calculateWins({required bool isWin, required int? previous}) {
    if (!isWin) {
      return previous ?? 0;
    }
    if (previous == null) {
      return 1;
    }
    return previous + 1;
  }

  int _calculateStreak({required bool isWin, required int? previous}) {
    if (!isWin) {
      return 0;
    }
    if (previous == null) {
      return 1;
    }
    return previous + 1;
  }

  int _calculateMaxStreak({required bool isWin, required int? previous}) {
    if (!isWin) {
      return previous ?? 0;
    }
    if (previous == null) {
      return 1;
    }
    return previous + 1;
  }

  List<int> _calculateAttempts({
    required int attempt,
    required List<int>? previous,
  }) {
    if (attempt == -1) {
      return previous ?? GameStatistics.zeroAttempts;
    }
    if (previous == null) {
      final currentAttempts = List<int>.of(GameStatistics.zeroAttempts);
      currentAttempts[attempt] += 1;
      return currentAttempts;
    }
    final currentAttempts = List<int>.of(previous);
    currentAttempts[attempt] += 1;
    return currentAttempts;
  }
}
