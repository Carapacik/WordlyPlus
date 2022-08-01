import 'package:flutter/foundation.dart';
import 'package:wordly/data/models/letter_status.dart';

@immutable
class LetterInfo {
  const LetterInfo({
    required this.letter,
    this.letterStatus = LetterStatus.unknown,
  });

  factory LetterInfo.empty() => const LetterInfo(letter: '');

  final String letter;
  final LetterStatus letterStatus;

  bool get isStatusUnknown => letterStatus == LetterStatus.unknown;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LetterInfo &&
          runtimeType == other.runtimeType &&
          letter == other.letter &&
          letterStatus == other.letterStatus;

  @override
  int get hashCode => letter.hashCode ^ letterStatus.hashCode;

  @override
  String toString() {
    return 'letter: $letter';
  }
}
