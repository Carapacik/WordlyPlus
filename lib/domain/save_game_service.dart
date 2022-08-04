import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/data/models.dart';

class SaveGameService {
  SaveGameService();

  static const _dailyBoardKey = 'daily_board_';
  static const _levelBoardKey = 'level_board_';
  static const _dailyResultKey = 'daily_result_';
  static const _levelInfoKey = 'level_info_';

  Future<void> saveDailyResult(
    GameResult result,
    DictionaryEnum dictionary,
  ) async {
    final sp = await SharedPreferences.getInstance();
    final rawWord = json.encode(result.toJson());
    await sp.setString(_dailyResultKey + dictionary.key, rawWord);
  }

  Future<void> saveLevelInfo(LevelInfo info, DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    final rawInfo = json.encode(info.toJson());
    await sp.setString(_levelInfoKey + dictionary.key, rawInfo);
  }

  Future<void> saveDailyBoard(
    List<LetterInfo> board,
    DictionaryEnum dictionary,
  ) async {
    return _saveBoard(board, _dailyBoardKey + dictionary.key);
  }

  Future<void> saveLevelBoard(
    List<LetterInfo> board,
    DictionaryEnum dictionary,
  ) async {
    return _saveBoard(board, _levelBoardKey + dictionary.key);
  }

  Future<GameResult?> getDailyResult(DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    final rawWord = sp.getString(_dailyResultKey + dictionary.key);
    if (rawWord == null) {
      return null;
    }
    return GameResult.fromJson(json.decode(rawWord) as Map<String, dynamic>);
  }

  Future<LevelInfo?> getLevelInfo(DictionaryEnum dictionary) async {
    final sp = await SharedPreferences.getInstance();
    final rawInfo = sp.getString(_levelInfoKey + dictionary.key);

    if (rawInfo == null) {
      return null;
    }
    return LevelInfo.fromJson(json.decode(rawInfo) as Map<String, dynamic>);
  }

  Future<List<LetterInfo>?> getDailyBoard(DictionaryEnum dictionary) async {
    return _getBoard(_dailyBoardKey + dictionary.key);
  }

  Future<List<LetterInfo>?> getLevelBoard(DictionaryEnum dictionary) async {
    return _getBoard(_levelBoardKey + dictionary.key);
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
