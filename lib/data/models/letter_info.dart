import 'package:wordly/data/models/letter_status.dart';

class LetterInfo {
  const LetterInfo({
    required this.letter,
    required this.letterStatus,
  });

  final String letter;
  final LetterStatus letterStatus;

  bool get isStatusUnknown => letterStatus == LetterStatus.unknown;
}
