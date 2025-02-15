import 'package:wordly/src/feature/game/model/letter_info.dart';

class GameResult {
  const GameResult({required this.secretWord, this.board = const [], this.isWin, this.lvlNumber});

  factory GameResult.fromJson(Map<String, dynamic> json) => GameResult(
    board: [],
    secretWord: json['secretWord'] as String,
    isWin: json['win'] as bool?,
    lvlNumber: json['lvl'] as int?,
  );

  final String secretWord;
  final List<LetterInfo> board;
  final bool? isWin;
  final int? lvlNumber;

  Map<String, dynamic> toJson() => <String, dynamic>{'secretWord': secretWord, 'win': isWin, 'lvl': lvlNumber};
}
