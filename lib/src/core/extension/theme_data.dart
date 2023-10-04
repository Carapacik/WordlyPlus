import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  TextStyle get tl => textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get tlb => textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      );

  TextStyle get tm => textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get tmb => textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      );

  TextStyle get bl => textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get blb => textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get ll => textTheme.labelLarge!;
}
