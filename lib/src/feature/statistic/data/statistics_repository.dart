import 'dart:async';
import 'dart:ui' show Locale;

import 'package:wordly/src/feature/statistic/data/statistics_datasource.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

abstract interface class IStatisticsRepository {
  Future<GameStatistics?> getStatistics(Locale dictionary);

  Future<void> setStatistics(Locale dictionary, {required bool isWin, required int attempt});
}

final class StatisticsRepository implements IStatisticsRepository {
  const StatisticsRepository({required IStatisticsDatasource statisticsDatasource})
    : _statisticsDatasource = statisticsDatasource;

  final IStatisticsDatasource _statisticsDatasource;

  @override
  Future<GameStatistics?> getStatistics(Locale dictionary) async =>
      _statisticsDatasource.getStatistics(dictionary.languageCode);

  @override
  Future<void> setStatistics(Locale dictionary, {required bool isWin, required int attempt}) async {
    final previousStatistic = await _statisticsDatasource.getStatistics(dictionary.languageCode);
    final currentStatistic = GameStatistics(
      loses: _calculateLoses(isWin: isWin, previous: previousStatistic?.loses),
      wins: _calculateWins(isWin: isWin, previous: previousStatistic?.wins),
      streak: _calculateStreak(isWin: isWin, previous: previousStatistic?.streak),
      maxStreak: _calculateMaxStreak(isWin: isWin, previous: previousStatistic?.maxStreak),
      attempts: _calculateAttempts(attempt: isWin ? attempt - 1 : -1, previous: previousStatistic?.attempts),
    );
    await _statisticsDatasource.setStatistics(dictionary.languageCode, currentStatistic);
  }

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

  List<int> _calculateAttempts({required int attempt, required List<int>? previous}) {
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
