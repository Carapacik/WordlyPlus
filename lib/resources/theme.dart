import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final themes = {
  AppTheme.lightTheme: ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryColorDark: const Color(0xFF0097A7),
    primaryColorLight: const Color(0xFFB2EBF2),
    primaryColor: const Color(0xFF00BCD4),
    colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
    scaffoldBackgroundColor: const Color(0xFFE0F2F1),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryColorDark: const Color(0xDCDA2EF3),
    primaryColorLight: const Color(0xDCEB94FF),
    primaryColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(secondary: Color(0xFFE575F3)),
    scaffoldBackgroundColor: const Color(0xFF343131),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  )
};
