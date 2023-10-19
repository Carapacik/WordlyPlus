import 'dart:convert' show json;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class GameDataSource {
  Future<void> saveDailyBoard(String dictionary, String date, List<LetterInfo> board);

  List<LetterInfo>? loadDailyFromCache(String dictionary, String date);
}

final class GameDataSourceImpl implements GameDataSource {
  const GameDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _boardPrefix = 'board';

  @override
  Future<void> saveDailyBoard(String dictionary, String date, List<LetterInfo> board) async {
    await _sharedPreferences.setString(
      '${_boardPrefix}_$dictionary',
      json.encode({
        'date': date,
        'board': board.map((e) => json.encode(e.toJson())).join('|'),
      }),
    );
  }

  @override
  List<LetterInfo>? loadDailyFromCache(String dictionary, String date) {
    final rawBoard = _sharedPreferences.getString(
      '${_boardPrefix}_$dictionary',
    );
    if (rawBoard == null) {
      return null;
    }
    final decodedBoard = json.decode(rawBoard) as Map<String, dynamic>;
    final oldDate = decodedBoard['date'].toString();
    if (date != oldDate) {
      return null;
    }
    final ss = decodedBoard['board'].toString().split('|').map((e) => json.decode(e) as Map<String, dynamic>).toList();
    return decodedBoard['board']
        .toString()
        .split('|')
        .map((e) => LetterInfo.fromJson(json.decode(e) as Map<String, dynamic>))
        .toList();
  }
}
