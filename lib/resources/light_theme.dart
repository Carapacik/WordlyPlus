import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordly/resources/colors.dart';

final _base = ThemeData.light();

final lightTheme = _base.copyWith(
  useMaterial3: true,
  backgroundColor: AppColors.lightBg,
  scaffoldBackgroundColor: AppColors.lightBg,
  textTheme: GoogleFonts.ubuntuTextTheme(_base.textTheme).copyWith(
    titleLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    button: const TextStyle(
      fontSize: 14,
      height: 1.15,
      fontWeight: FontWeight.w700,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      elevation: MaterialStateProperty.all(0),
      // foregroundColor: MaterialStateProperty.all(AppColors.lightWhite100),
      // backgroundColor: MaterialStateProperty.resolveWith((states) {
      //   if (states.contains(MaterialState.disabled)) {
      //     return AppColors.lightLightBlue70;
      //   }
      //   return AppColors.lightDarkBlue100;
      // }),
    ),
  ),
  // textSelectionTheme: _base.textSelectionTheme.copyWith(
  //   cursorColor: AppColors.lightDarkBlue100,
  //   selectionHandleColor: AppColors.lightLightBlue100,
  // ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    // backgroundColor: AppColors.lightWhite100,
    // foregroundColor: AppColors.lightDarkBlue100,
  ),
);
