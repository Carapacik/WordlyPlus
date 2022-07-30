import 'package:shared_preferences/shared_preferences.dart';

class SaveGameService {
  SaveGameService();

  static const _dailyBoard = 'daily_board_key';
  static const _dailyWord = 'daily_word_key';

  static const _levelBoard = 'level_board_key';
  static const _levelNumber = 'level_number_key';

  Future<void> saveDailyWord(String word) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_dailyWord, word);
  }

  Future<String?> getDailyWord() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_dailyWord);
  }

  // TODO replace board type from String to BoardData
  Future<void> saveDailyBoard(String board) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_dailyBoard, board);
  }

  // TODO replace board type from String to BoardData
  Future<String> getDailyBoard() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_dailyBoard) ?? '';
  }

  Future<void> saveLevelNumber(int number) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt(_levelNumber, number);
  }

  Future<int> getLevelNumber() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(_levelNumber) ?? 1;
  }
}
