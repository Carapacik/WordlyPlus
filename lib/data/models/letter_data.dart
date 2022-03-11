import 'package:wordle/data/models/letter_status.dart';

class LetterData {
  LetterData({required this.letter, required this.status});

  final String letter;
  final LetterStatus status;
}
