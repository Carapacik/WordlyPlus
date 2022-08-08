import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordly/resources/colors.dart';

final _base = ThemeData.light();

final lightTheme = _base.copyWith(
  // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenLight),
  useMaterial3: true,
  backgroundColor: AppColors.bgLight,
  scaffoldBackgroundColor: AppColors.bgLight,
  textTheme: GoogleFonts.ubuntuTextTheme(_base.textTheme).copyWith(
    titleLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    labelLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 48,
        ),
      ),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(AppColors.bgLight),
    ),
  ),
  // textSelectionTheme: _base.textSelectionTheme.copyWith(
  //   cursorColor: AppColors.lightDarkBlue100,
  //   selectionHandleColor: AppColors.lightLightBlue100,
  // ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.bgLight,
    foregroundColor: AppColors.bgDark,
  ),
);
