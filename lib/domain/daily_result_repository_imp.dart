import 'package:wordly/data/models/daily_result_data.dart';
import 'package:wordly/domain/daily_result_repository.dart';

class DailyResultRepositoryImp implements DailyResultRepository {
  late DailyResultData _dailyResult;

  @override
  DailyResultData get dailyResult => _dailyResult;

  @override
  Future<DailyResultData> getDailyResult() async {
    // TODO: implement getDailyResult
    throw UnimplementedError();
  }

  @override
  Future<void> saveDailyResult(DailyResultData data) async {
    // TODO: implement saveDailyResult
    throw UnimplementedError();
  }
}
