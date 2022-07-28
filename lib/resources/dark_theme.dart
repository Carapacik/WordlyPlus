import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordly/resources/colors.dart';

final _base = ThemeData.dark();

final darkTheme = _base.copyWith(
  useMaterial3: true,
  backgroundColor: AppColors.darkBg,
  scaffoldBackgroundColor: AppColors.darkBg,
  textTheme: GoogleFonts.ubuntuTextTheme(_base.textTheme).copyWith(
    titleLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    labelLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.white,
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
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.darkBg,
    foregroundColor: AppColors.lightBg,
  ),
);
