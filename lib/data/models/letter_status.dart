import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/resources/resources.dart';

enum LetterStatus {
  unknown,
  notInWord,
  wrongSpot,
  correctSpot;

  const LetterStatus();

  Color keyboardItemColor(BuildContext context) {
    final isHighContrast = context.read<ThemeBloc>().state.isHighContrast;
    switch (this) {
      case LetterStatus.unknown:
        return context.dynamicColor(
          light: AppColors.lightGrey,
          dark: AppColors.darkGrey,
        );
      case LetterStatus.notInWord:
        return context.dynamicColor(
          light: AppColors.greyLight,
          dark: AppColors.greyDark,
        );
      case LetterStatus.wrongSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.blueLight,
                dark: AppColors.blueDark,
              )
            : context.dynamicColor(
                light: AppColors.yellowLight,
                dark: AppColors.yellowDark,
              );
      case LetterStatus.correctSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.orangeLight,
                dark: AppColors.orangeDark,
              )
            : context.dynamicColor(
                light: AppColors.greenLight,
                dark: AppColors.greenDark,
              );
    }
  }

  Color gridItemColor(BuildContext context) {
    final isHighContrast = context.read<ThemeBloc>().state.isHighContrast;
    switch (this) {
      case LetterStatus.unknown:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return context.dynamicColor(
          light: AppColors.greyLight,
          dark: AppColors.greyDark,
        );
      case LetterStatus.wrongSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.blueLight,
                dark: AppColors.blueDark,
              )
            : context.dynamicColor(
                light: AppColors.yellowLight,
                dark: AppColors.yellowDark,
              );
      case LetterStatus.correctSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.orangeLight,
                dark: AppColors.orangeDark,
              )
            : context.dynamicColor(
                light: AppColors.greenLight,
                dark: AppColors.greenDark,
              );
    }
  }

  String toEmoji() {
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
