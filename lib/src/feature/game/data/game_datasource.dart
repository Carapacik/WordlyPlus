import 'dart:convert' show json;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class GameDataSource {
  Future<void> saveDailyBoard(String dictionary, String date, GameResult savedResult);

  Future<void> saveLvlBoard(String dictionary, GameResult savedResult);

  GameResult? loadDailyFromCache(String dictionary, String date);

  GameResult? loadLvlFromCache(String dictionary);

  bool get isFirstEnter;

  Future<void> saveFirstEnter();
}

final class GameDataSourceImpl implements GameDataSource {
  const GameDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _boardPrefix = 'board';
  static const _firstEnterPrefix = 'is_first_enter';

  @override
  bool get isFirstEnter => _sharedPreferences.getBool(_firstEnterPrefix) ?? true;

  @override
  Future<void> saveFirstEnter() => _sharedPreferences.setBool(_firstEnterPrefix, false);

  @override
  Future<void> saveDailyBoard(String dictionary, String date, GameResult savedResult) async {
    await _sharedPreferences.setString(
      '${_boardPrefix}_${dictionary}_${GameMode.daily.index}',
      json.encode({
        'date': date,
        'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
        'secretWord': savedResult.secretWord,
        'win': savedResult.isWin,
      }),
    );
  }

  @override
  Future<void> saveLvlBoard(String dictionary, GameResult savedResult) async {
    await _sharedPreferences.setString(
      '${_boardPrefix}_${dictionary}_${GameMode.lvl.index}',
      json.encode({
        'lvl': savedResult.lvlNumber,
        'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
        'secretWord': savedResult.secretWord,
        'win': savedResult.isWin,
      }),
    );
  }

  @override
  GameResult? loadDailyFromCache(String dictionary, String date) {
    final rawResult = _sharedPreferences.getString(
      '${_boardPrefix}_${dictionary}_${GameMode.daily.index}',
    );
    if (rawResult == null) {
      return null;
    }
    final decodedResult = json.decode(rawResult) as Map<String, dynamic>;
    final oldDate = decodedResult['date'].toString();
    final oldSecretWord = decodedResult['secretWord']?.toString();
    if (date != oldDate || oldSecretWord == null) {
      return null;
    }
    final board = decodedResult['board']
        .toString()
        .split('|')
        .map((e) => LetterInfo.fromJson(json.decode(e) as Map<String, dynamic>))
        .toList();
    final isWin = bool.tryParse(decodedResult['win'].toString());
    return GameResult(board: board, isWin: isWin, secretWord: oldSecretWord);
  }

  @override
  GameResult? loadLvlFromCache(String dictionary) {
    final rawResult = _sharedPreferences.getString(
      '${_boardPrefix}_${dictionary}_${GameMode.lvl.index}',
    );
    if (rawResult == null) {
      return null;
    }
    final decodedResult = json.decode(rawResult) as Map<String, dynamic>;
    final oldLvlNumber = int.tryParse(decodedResult['lvl'].toString());
    final oldSecretWord = decodedResult['secretWord']?.toString();
    if (oldLvlNumber == null || oldSecretWord == null) {
      return null;
    }
    final isWin = bool.tryParse(decodedResult['win'].toString());
    var board = <LetterInfo>[];
    final rawBoard = decodedResult['board'].toString().trim();
    if (rawBoard.isNotEmpty) {
      board = rawBoard.split('|').map((e) => LetterInfo.fromJson(json.decode(e) as Map<String, dynamic>)).toList();
    }
    return GameResult(board: board, isWin: isWin, secretWord: oldSecretWord, lvlNumber: oldLvlNumber);
  }
}
