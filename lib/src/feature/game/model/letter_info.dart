import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/color.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

@immutable
class LetterInfo {
  const LetterInfo({required this.letter, this.status = LetterStatus.unknown});

  factory LetterInfo.fromJson(Map<String, dynamic> json) =>
      LetterInfo(letter: json['letter'] as String, status: LetterStatus.values[json['status'] as int]);

  final String letter;
  final LetterStatus status;

  Map<String, Object?> toJson() => <String, Object?>{'letter': letter, 'status': status.index};

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

  bool operator <(LetterStatus other) => other.index < index;

  Color cellColor(BuildContext context, {bool listen = true}) {
    final theme = SettingsScope.settingsOf(context, listen: listen).appTheme;
    return switch (this) {
      LetterStatus.correctSpot => theme.correctColor,
      LetterStatus.wrongSpot => theme.wrongSpotColor,
      LetterStatus.notInWord => theme.notInWordColor(context),
      LetterStatus.unknown => theme.unknownColor(context),
    };
  }

  Color? textColor(BuildContext context, {bool listen = true}) {
    final theme = SettingsScope.settingsOf(context, listen: listen).appTheme;
    final isDark = theme.isDarkTheme(context);
    final color = cellColor(context);

    // other mode not in word always darken
    if (theme.colorMode == ColorMode.other && this == LetterStatus.notInWord) {
      return darken(color, 0.3);
    }
    // for empty basic tiles
    if (this == LetterStatus.notInWord || this == LetterStatus.unknown) {
      final primary = !isDark && this == LetterStatus.notInWord || isDark && this == LetterStatus.unknown;
      return primary ? AppColors.secondary : AppColors.primary;
    }
    // for high contrast
    if (theme.colorMode == ColorMode.highContrast) {
      return Colors.white;
    }
    return darken(color, 0.3);
  }

  String get emoji => switch (this) {
    LetterStatus.correctSpot => '🟩',
    LetterStatus.wrongSpot => '🟨',
    LetterStatus.notInWord => '⬛',
    LetterStatus.unknown => '',
  };
}
