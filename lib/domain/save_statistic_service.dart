import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/data/models.dart';

abstract class ISaveStatisticService {
  Future<StatisticInfo?> getDailyStatistic(DictionaryEnum dictionary);

  Future<void> saveDailyStatistic({
    required bool isWin,
    required int attempt,
    required DictionaryEnum dictionary,
  });
}

class SaveStatisticService implements ISaveStatisticService {
  SaveStatisticService();

  static const _statisticKey = 'statistic_';

  @override
  Future<StatisticInfo?> getDailyStatistic(DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    final rawInfo = sp.getString(_statisticKey + dictionary.key);
    if (rawInfo == null) {
      return null;
    }
    return StatisticInfo.fromJson(json.decode(rawInfo) as Map<String, dynamic>);
  }

  @override
  Future<void> saveDailyStatistic({
    required bool isWin,
    required int attempt,
    required DictionaryEnum dictionary,
  }) async {
    final sp = await SharedPreferences.getInstance();
    final previousStatistic = await getDailyStatistic(dictionary);
    final currentStatistic = StatisticInfo(
      loses: _calculateLoses(
        isWin: isWin,
        previousLoses: previousStatistic?.loses,
      ),
      wins: _calculateWins(isWin: isWin, previousWins: previousStatistic?.wins),
      attempts: _calculateAttempts(
        attempt: isWin ? attempt : -1,
        previousAttempts: previousStatistic?.attempts,
      ),
    );
    final rawInfo = json.encode(currentStatistic.toJson());
    await sp.setString(_statisticKey + dictionary.key, rawInfo);
  }

  int _calculateLoses({required bool isWin, required int? previousLoses}) {
    if (isWin) {
      return previousLoses ?? 0;
    }
    if (previousLoses == null) {
      return 1;
    }
    return previousLoses + 1;
  }

  int _calculateWins({required bool isWin, required int? previousWins}) {
    if (!isWin) {
      return previousWins ?? 0;
    }
    if (previousWins == null) {
      return 1;
    }
    return previousWins + 1;
  }

  List<int> _calculateAttempts({
    required int attempt,
    required List<int>? previousAttempts,
  }) {
    const zeroAttempts = <int>[0, 0, 0, 0, 0, 0];
    if (attempt == -1) {
      return previousAttempts ?? zeroAttempts;
    }
    if (previousAttempts == null) {
      final currentAttempts = List<int>.of(zeroAttempts);
      currentAttempts[attempt] += 1;
      return currentAttempts;
    }
    final currentAttempts = List<int>.of(previousAttempts);
    currentAttempts[attempt] += 1;
    return currentAttempts;
  }
}
