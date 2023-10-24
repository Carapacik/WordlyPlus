import 'package:wordly/src/feature/game/model/letter_info.dart';

class GameResult {
  const GameResult({
    required this.secretWord,
    required this.board,
    this.isWin,
    this.lvlNumber,
  });

  final bool? isWin;
  final String secretWord;
  final List<LetterInfo> board;
  final int? lvlNumber;
}
