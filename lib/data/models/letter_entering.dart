import 'package:equatable/equatable.dart';
import 'package:wordly/data/models/letter_status.dart';

class LetterEntering extends Equatable {
  const LetterEntering({required this.letter, required this.letterStatus});

  final String letter;
  final LetterStatus letterStatus;

  @override
  List<Object?> get props => [letter, letterStatus];
}
