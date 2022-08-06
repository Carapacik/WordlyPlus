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

  Color keyboardItemColor(final BuildContext context) {
    final isHighContrast = context.read<ThemeBloc>().state.isHighContrast;
    switch (this) {
      case LetterStatus.unknown:
        return context.dynamicColor(
          light: AppColors.darkBg,
          dark: AppColors.lightBg,
        );
      case LetterStatus.notInWord:
        return context.dynamicColor(
          light: AppColors.grey,
          dark: AppColors.grey,
        );
      case LetterStatus.wrongSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.highContrastBlue,
                dark: AppColors.highContrastBlue,
              )
            : context.dynamicColor(
                light: AppColors.yellow,
                dark: AppColors.yellow,
              );
      case LetterStatus.correctSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.highContrastOrange,
                dark: AppColors.highContrastOrange,
              )
            : context.dynamicColor(
                light: AppColors.green,
                dark: AppColors.green,
              );
    }
  }

  Color gridItemColor(final BuildContext context) {
    final isHighContrast = context.read<ThemeBloc>().state.isHighContrast;
    switch (this) {
      case LetterStatus.unknown:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return context.dynamicColor(
          light: AppColors.grey,
          dark: AppColors.grey,
        );
      case LetterStatus.wrongSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.highContrastBlue,
                dark: AppColors.highContrastBlue,
              )
            : context.dynamicColor(
                light: AppColors.yellow,
                dark: AppColors.yellow,
              );
      case LetterStatus.correctSpot:
        return isHighContrast
            ? context.dynamicColor(
                light: AppColors.highContrastOrange,
                dark: AppColors.highContrastOrange,
              )
            : context.dynamicColor(
                light: AppColors.green,
                dark: AppColors.green,
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
