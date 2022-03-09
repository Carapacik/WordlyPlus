import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  factory SharedPreferenceData.getInstance() =>
      _instance ??= SharedPreferenceData._internal();

  SharedPreferenceData._internal();

  static SharedPreferenceData? _instance;
  static const dailyResultKey = "daily_result_key";
  static const settingsDataKey = "settings_data_key";
  static const gameStatisticKey = "game_statistic_key";

  Future<String?> getDailyResult() async => _getData(dailyResultKey);

  Future<bool> saveDailyResult(final String dailyResult) async =>
      _saveData(dailyResultKey, dailyResult);

  Future<String?> getSettingsData() async => _getData(settingsDataKey);

  Future<bool> saveSettingsData(final String settingsData) async =>
      _saveData(settingsDataKey, settingsData);

  Future<String?> getGameStatistic() async => _getData(gameStatisticKey);

  Future<bool> saveGameStatistic(final String gameStatistic) async =>
      _saveData(gameStatisticKey, gameStatistic);

  Future<bool> _saveData(final String key, final String data) async {
    final sp = await SharedPreferences.getInstance();
    final result = sp.setString(dailyResultKey, data);
    return result;
  }

  Future<String?> _getData(final String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }
}
