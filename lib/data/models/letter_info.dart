import 'package:wordly/data/models/letter_status.dart';

class LetterInfo {
  const LetterInfo({
    required this.letter,
    this.letterStatus = LetterStatus.unknown,
  });

  final String letter;
  final LetterStatus letterStatus;

  bool get isStatusUnknown => letterStatus == LetterStatus.unknown;
}
