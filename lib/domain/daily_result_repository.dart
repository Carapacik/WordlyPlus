import 'package:wordly/data/models/daily_result_data.dart';

abstract class DailyResultRepository {
  DailyResultData get dailyResult;

  Future<void> initDailyResult();

  Future<void> saveDailyResult(final DailyResultData data);
}
