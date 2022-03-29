import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/models/daily_statistic_data.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';

class DailyStatisticRepositoryImpl implements DailyStatisticRepository {
  late DailyStatisticData _statisticData;

  @override
  DailyStatisticData get statisticData => _statisticData;

  @override
  Future<void> initStatisticData() async {
    final result = await GetIt.I<Isar>().dailyStatisticDatas.get(0);
    _statisticData = result ?? DailyStatisticData.init();
  }

  @override
  Future<void> saveStatisticData({
    required final bool isWin,
    required final int attempt,
  }) async {
    late DailyStatisticData data;
    if (isWin) {
      data = _statisticData.copyWith(
        winsNumber: _statisticData.winsNumber++,
        currentStreak: _statisticData.currentStreak++,
      );
    } else {
      data = _statisticData.copyWith(
        losesNumber: _statisticData.losesNumber++,
        currentStreak: 0,
      );
    }
    await GetIt.I<Isar>().writeTxn((isar) async {
      _statisticData = data;
      await isar.dailyStatisticDatas.put(_statisticData);
    });
  }
}
