import 'dart:convert' show json;

import 'package:wordly/src/core/utils/preferences_dao.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class GameDataSource {
  Future<void> setDailyBoard(String dictionary, String date, GameResult savedResult);

  Future<void> setLvlBoard(String dictionary, GameResult savedResult);

  GameResult? getDaily(String dictionary, String date);

  GameResult? getLvl(String dictionary);

  bool get isFirstEnter;

  Future<void> setFirstEnter();
}

final class GameDataSourceLocal extends PreferencesDao implements GameDataSource {
  const GameDataSourceLocal({
    required super.sharedPreferences,
  });

  PreferencesEntry<String> _board(String dictionary, int index) => stringEntry('board_${dictionary}_$index');

  PreferencesEntry<bool> get _firstEnter => boolEntry('is_first_enter');

  @override
  bool get isFirstEnter => _firstEnter.read() ?? true;

  @override
  Future<void> setFirstEnter() => _firstEnter.setIfNullRemove(false);

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
      _board(dictionary, GameMode.lvl.index).setIfNullRemove(
        json.encode({
          'lvl': savedResult.lvlNumber,
          'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
          'secretWord': savedResult.secretWord,
          'win': savedResult.isWin,
        }),
      );

  @override
  GameResult? getDaily(String dictionary, String date) {
    final rawResult = _board(dictionary, GameMode.daily.index).read();
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
  GameResult? getLvl(String dictionary) {
    final rawResult = _board(dictionary, GameMode.lvl.index).read();
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
