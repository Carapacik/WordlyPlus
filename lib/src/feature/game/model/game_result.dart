import 'package:wordly/src/feature/game/model/letter_info.dart';

class GameResult {
  const GameResult({
    required this.secretWord,
    required this.isWin,
    required this.board,
  });

  final String secretWord;
  final bool? isWin;
  final List<LetterInfo> board;
}
