import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/models/attempts.dart';
import 'package:wordly/data/models/daily_statistic_data.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';

class DailyStatisticRepositoryImpl implements DailyStatisticRepository {
  late DailyStatisticData _statisticData;

  @override
  DailyStatisticData get statisticData => _statisticData;

  @override
  Future<void> initStatisticData() async {
    final result = await GetIt.I<Isar>().dailyStatisticDatas.get(0);
    _statisticData = result ?? DailyStatisticData()
      ..id = 0
      ..currentStreak = 0
      ..losesNumber = 0
      ..winsNumber = 0
      ..attempts = Attempts(0, 0, 0, 0, 0, 0);
  }

  @override
  Future<void> saveStatisticData(DailyStatisticData data) async {
    await GetIt.I<Isar>().writeTxn((isar) async {
      _statisticData = data;
      await isar.dailyStatisticDatas.put(_statisticData);
    });
  }
}
