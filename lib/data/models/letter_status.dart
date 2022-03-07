import 'package:flutter/material.dart';
import 'package:wordle/resources/app_colors.dart';

enum LetterStatus {
  unknown,
  notInWords,
  wrongSpot,
  correctSpot,
}

extension LetterStatusExtension on LetterStatus {
  Color color(final BuildContext context, {final bool highContrast = true}) {
    switch (this) {
      case LetterStatus.unknown:
        return AppColors.grey;
      case LetterStatus.notInWords:
        return AppColors.darkGrey;
      case LetterStatus.wrongSpot:
        return AppColors.yellow;
      case LetterStatus.correctSpot:
        return AppColors.green;
    }
  }
}
