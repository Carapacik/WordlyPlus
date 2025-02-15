import 'dart:async';
import 'dart:convert' show json;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/utils/persisted_entry.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class IGameDatasource {
  Future<GameResult?> getDaily(String dictionary, String date);

  Future<GameResult?> getLvl(String dictionary);

  Future<void> setDailyBoard(String dictionary, String date, GameResult savedResult);

  Future<void> setLvlBoard(String dictionary, GameResult savedResult);

  Future<bool?> get isFirstEnter;

  Future<void> setFirstEnter();
}

final class GameDatasource implements IGameDatasource {
  GameDatasource({required this.sharedPreferences});

  final SharedPreferencesAsync sharedPreferences;

  StringPreferencesEntry _board(String dictionaryKey, int index) =>
      StringPreferencesEntry(sharedPreferences: sharedPreferences, key: 'game.board.$dictionaryKey.$index');

  BoolPreferencesEntry get _isFirstEnter =>
      BoolPreferencesEntry(sharedPreferences: sharedPreferences, key: 'game.isFirstEnter');

  @override
  Future<GameResult?> getDaily(String dictionary, String date) async {
    final rawResult = await _board(dictionary, GameMode.daily.index).read();
    if (rawResult == null) {
      return null;
    }
    final decodedResult = json.decode(rawResult) as Map<String, dynamic>;
    final oldDate = decodedResult['date'].toString();
    final oldSecretWord = decodedResult['secretWord']?.toString();
    if (date != oldDate || oldSecretWord == null) {
      return null;
    }
    final board =
        decodedResult['board']
            .toString()
            .split('|')
            .map((e) => LetterInfo.fromJson(json.decode(e) as Map<String, dynamic>))
            .toList();
    final isWin = bool.tryParse(decodedResult['win'].toString());
    return GameResult(board: board, isWin: isWin, secretWord: oldSecretWord);
  }

  @override
  Future<GameResult?> getLvl(String dictionary) async {
    final rawResult = await _board(dictionary, GameMode.lvl.index).read();
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

  @override
  Future<void> setDailyBoard(String dictionary, String date, GameResult savedResult) async =>
      _board(dictionary, GameMode.daily.index).setIfNullRemove(
        json.encode({
          'date': date,
          'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
          'secretWord': savedResult.secretWord,
          'win': savedResult.isWin,
        }),
      );

  @override
  Future<void> setLvlBoard(String dictionary, GameResult savedResult) async =>
      _board(dictionary, GameMode.lvl.index).set(
        json.encode({
          'lvl': savedResult.lvlNumber,
          'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
          'secretWord': savedResult.secretWord,
          'win': savedResult.isWin,
        }),
      );

  @override
  Future<bool?> get isFirstEnter => _isFirstEnter.read();

  @override
  Future<void> setFirstEnter() => _isFirstEnter.set(false);
}
