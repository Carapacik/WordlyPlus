import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  factory SharedPreferenceData.getInstance() =>
      _instance ??= SharedPreferenceData._internal();

  SharedPreferenceData._internal();

  static SharedPreferenceData? _instance;
  static const dailyResultKey = "daily_result_key";

  Future<bool> saveDailyResult(final String dailyResult) async {
    final sp = await SharedPreferences.getInstance();
    final result = sp.setString(dailyResultKey, dailyResult);
    return result;
  }

  Future<String?> getDailyResult() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(dailyResultKey);
  }
}
