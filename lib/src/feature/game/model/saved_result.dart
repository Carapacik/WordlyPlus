import 'package:wordly/src/feature/game/model/letter_info.dart';

class SavedResult {
  const SavedResult({
    required this.secretWord,
    required this.isWin,
    required this.board,
  });

  final String secretWord;
  final bool? isWin;
  final List<LetterInfo> board;
}
