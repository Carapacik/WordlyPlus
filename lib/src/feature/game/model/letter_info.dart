import 'package:flutter/material.dart';

@immutable
class LetterInfo {
  const LetterInfo({required this.letter, this.status = LetterStatus.unknown});

  factory LetterInfo.fromJson(Map<String, dynamic> json) => LetterInfo(
        letter: json['letter'] as String,
        status: LetterStatus.values[json['status'] as int],
      );

  final String letter;
  final LetterStatus status;

  Map<String, Object?> toJson() => <String, Object?>{
        'letter': letter,
        'status': status.index,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LetterInfo && runtimeType == other.runtimeType && letter == other.letter && status == other.status;

  @override
  int get hashCode => letter.hashCode ^ status.hashCode;

  @override
  String toString() => '($letter ${status.emoji})';
}

enum LetterStatus {
  correctSpot,
  wrongSpot,
  notInWord,
  unknown;

  Color get color {
    switch (this) {
      case LetterStatus.correctSpot:
        return Colors.green;
      case LetterStatus.wrongSpot:
        return Colors.yellow;
      case LetterStatus.notInWord:
        return Colors.grey;
      case LetterStatus.unknown:
        return Colors.transparent;
    }
  }

  String get emoji {
    switch (this) {
      case LetterStatus.unknown:
      case LetterStatus.notInWord:
        return '⬛';
      case LetterStatus.wrongSpot:
        return '🟨';
      case LetterStatus.correctSpot:
        return '🟩';
    }
  }
}
