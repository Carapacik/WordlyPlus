import 'package:flutter/material.dart';
import 'package:wordle/resources/app_colors.dart';

enum LetterStatus {
  unknown,
  notInWords,
  wrongSpot,
  correctSpot,
}

extension LetterStatusExtension on LetterStatus {
  Color color(final BuildContext context, {final bool highContrast = false}) {
    switch (this) {
      case LetterStatus.unknown:
        return Theme.of(context).cardColor;
      case LetterStatus.notInWords:
        return Theme.of(context).shadowColor;
      case LetterStatus.wrongSpot:
        return highContrast ? AppColors.highContrastBlue : AppColors.yellow;
      case LetterStatus.correctSpot:
        return highContrast ? AppColors.highContrastOrange : AppColors.green;
    }
  }
}
