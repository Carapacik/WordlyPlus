import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/color.dart';
import 'package:wordly/src/feature/app/widget/theme_scope.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

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

  Color cellColor(BuildContext context) {
    final theme = ThemeScope.of(context).theme;
    switch (this) {
      case LetterStatus.correctSpot:
        return theme.correctColor;
      case LetterStatus.wrongSpot:
        return theme.wrongSpotColor;
      case LetterStatus.notInWord:
        return theme.notInWordColor(context);
      case LetterStatus.unknown:
        return theme.unknownColor(context);
    }
  }

  Color? textColor(BuildContext context) {
    final theme = ThemeScope.of(context).theme;
    final isDark = theme.isDark(context);
    if (theme.colorMode == ColorMode.highContrast) {
      return Colors.white;
    }
    final color = cellColor(context);
    return isDark ? darken(color, 0.2) : lighten(color, 0.2);
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
