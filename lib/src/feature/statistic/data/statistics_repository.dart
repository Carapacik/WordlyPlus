import 'dart:async';
import 'dart:ui' show Locale;

import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

/// {@template statistic_repository}
/// Repository which manages the daily statistic.
/// {@endtemplate}
abstract interface class StatisticsRepository {
  /// Set statistic
  Future<void> setStatistics(
    Locale dictionary, {
    required bool isWin,
    required int attempt,
  });

  /// Observe current statistic changes
  GameStatistics? getStatistics(Locale dictionary);
}

/// {@macro statistic_repository}
final class StatisticsRepositoryImpl implements StatisticsRepository {
  /// {@macro statistic_repository}
  const StatisticsRepositoryImpl({required StatisticsDataSource statisticsDataSource})
      : _statisticsDataSource = statisticsDataSource;

  final StatisticsDataSource _statisticsDataSource;

  @override
  Future<void> setStatistics(
    Locale dictionary, {
    required bool isWin,
    required int attempt,
  }) async {
    final previousStatistic = _statisticsDataSource.getStatistics(dictionary.languageCode);
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
    await _statisticsDataSource.setStatistics(dictionary.languageCode, currentStatistic);
  }

  @override
  GameStatistics? getStatistics(Locale dictionary) => _statisticsDataSource.getStatistics(dictionary.languageCode);

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
