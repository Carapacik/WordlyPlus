import 'package:wordly/data/models/daily_result_data.dart';

abstract class DailyResultRepository {
  DailyResultData get dailyResult;

  Future<DailyResultData> getDailyResult();

  Future<void> saveDailyResult(final DailyResultData data);
}
