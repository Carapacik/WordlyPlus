import 'package:meta/meta.dart';

@immutable
class LetterInfo {
  const LetterInfo({required this.letter, this.status = LetterStatus.unknown});

  final String letter;
  final LetterStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LetterInfo && runtimeType == other.runtimeType && letter == other.letter && status == other.status;

  @override
  int get hashCode => letter.hashCode ^ status.hashCode;

  @override
  String toString() => 'LetterInfo($letter - $status)';
}

enum LetterStatus {
  correctSpot,
  wrongSpot,
  notInWord,
  unknown;
}
