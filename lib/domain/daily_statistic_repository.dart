import 'package:wordly/data/models/daily_statistic_data.dart';

abstract class DailyStatisticRepository {
  DailyStatisticData get statisticData;

  Future<void> initStatisticData();

  Future<void> saveStatisticData({
    required final bool isWin,
    required final int attempt,
  });
}
