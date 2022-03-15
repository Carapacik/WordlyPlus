import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle/data/repositories/settings_repository.dart';

class SharedPreferenceData {
  factory SharedPreferenceData.getInstance() =>
      _instance ??= SharedPreferenceData._internal();

  SharedPreferenceData._internal();

  static SharedPreferenceData? _instance;
  static const dailyResultKeyRu = "daily_result_key_ru";
  static const dailyResultKeyEn = "daily_result_key_en";
  static const settingsDataKey = "settings_data_key";
  static const gameStatisticKey = "game_statistic_key";
  static const statisticKey = "statistic_key";
  static const boardStateKey = "board_state_key";

  Future<String?> getDailyResult() async {
    final language = await SettingsRepository.getInstance().getItem();
    final key =
        language?.appLanguage == "en" ? dailyResultKeyEn : dailyResultKeyRu;
    return _getData(key);
  }

  Future<bool> saveDailyResult(final String dailyResult) async {
    // TODO: get dictionary lang, not app lang
    final language = await SettingsRepository.getInstance().getItem();
    final key =
        language?.appLanguage == "en" ? dailyResultKeyEn : dailyResultKeyRu;
    return _saveData(key, dailyResult);
  }

  Future<String?> getBoardData() async => _getData(boardStateKey);

  Future<bool> saveBoardData(final String boardData) async =>
      _saveData(boardStateKey, boardData);

  Future<String?> getSettingsData() async => _getData(settingsDataKey);

  Future<bool> saveSettingsData(final String settingsData) async =>
      _saveData(settingsDataKey, settingsData);

  Future<String?> getGameStatistic() async => _getData(gameStatisticKey);

  Future<bool> saveGameStatistic(final String gameStatistic) async =>
      _saveData(gameStatisticKey, gameStatistic);

  Future<String?> getStatistic() async => _getData(statisticKey);

  Future<bool> saveStatistic(final String statistic) async =>
      _saveData(statisticKey, statistic);

  Future<bool> _saveData(final String key, final String data) async {
    final sp = await SharedPreferences.getInstance();
    final result = sp.setString(key, data);
    return result;
  }

  Future<String?> _getData(final String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }
}
