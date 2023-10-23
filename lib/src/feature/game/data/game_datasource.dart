import 'dart:convert' show json;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class GameDataSource {
  Future<void> saveDailyBoard(String dictionary, String date, GameResult savedResult);

  GameResult? loadDailyFromCache(String dictionary, String date);
}

final class GameDataSourceImpl implements GameDataSource {
  const GameDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _boardPrefix = 'board';

  @override
  Future<void> saveDailyBoard(String dictionary, String date, GameResult savedResult) async {
    await _sharedPreferences.setString(
      '${_boardPrefix}_$dictionary',
      json.encode({
        'date': date,
        'board': savedResult.board.map((e) => json.encode(e.toJson())).join('|'),
        'secretWord': savedResult.secretWord,
        'win': savedResult.isWin,
      }),
    );
  }

  @override
  GameResult? loadDailyFromCache(String dictionary, String date) {
    final rawResult = _sharedPreferences.getString(
      '${_boardPrefix}_$dictionary',
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
    final ss = decodedResult['board'].toString().split('|').map((e) => json.decode(e) as Map<String, dynamic>).toList();
    final board = decodedResult['board']
        .toString()
        .split('|')
        .map((e) => LetterInfo.fromJson(json.decode(e) as Map<String, dynamic>))
        .toList();
    final isWin = bool.tryParse(decodedResult['win'].toString());
    return GameResult(board: board, isWin: isWin, secretWord: oldSecretWord);
  }
}
