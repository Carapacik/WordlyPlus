import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/data/models.dart';

class SaveGameService {
  SaveGameService();

  static const _dailyBoard = 'daily_board_';
  static const _dailyWord = 'daily_word_';
  static const _levelBoard = 'level_board_';
  static const _levelNumber = 'level_number_'; // Last completed

  Future<void> saveDailyWord(String word, DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_dailyWord + dictionary.key, word);
  }

  Future<String?> getDailyWord(DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_dailyWord + dictionary.key);
  }

  Future<void> saveDailyBoard(
    List<LetterInfo> board,
    DictionaryEnum dictionary,
  ) async {
    return _saveBoard(board, _dailyBoard + dictionary.key);
  }

  Future<void> saveLevelBoard(
    List<LetterInfo> board,
    DictionaryEnum dictionary,
  ) async {
    return _saveBoard(board, _levelBoard + dictionary.key);
  }

  Future<List<LetterInfo>?> getDailyBoard(DictionaryEnum dictionary) async {
    return _getBoard(_dailyBoard + dictionary.key);
  }

  Future<List<LetterInfo>?> getLevelBoard(DictionaryEnum dictionary) async {
    return _getBoard(_levelBoard + dictionary.key);
  }

  Future<void> saveLevelNumber(int number, DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt(_levelNumber + dictionary.key, number);
  }

  Future<int> getLevelNumber(DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(_levelNumber + dictionary.key) ?? 1;
  }

  Future<void> _saveBoard(List<LetterInfo> list, String key) async {
    final sp = await SharedPreferences.getInstance();
    final rawBoard =
        list.map((rawItem) => json.encode(rawItem.toJson())).toList();
    await sp.setStringList(key, rawBoard);
  }

  Future<List<LetterInfo>?> _getBoard(String key) async {
    final sp = await SharedPreferences.getInstance();
    final rawBoard = sp.getStringList(key);
    return rawBoard
        ?.map(
          (rawItem) =>
              LetterInfo.fromJson(json.decode(rawItem) as Map<String, dynamic>),
        )
        .toList();
  }
}
