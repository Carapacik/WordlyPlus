import 'package:flutter/material.dart';
import 'package:wordly/resources/l10n.dart';

extension ContextHelper on BuildContext {
  R get r => R.of(this);

  ThemeData get theme => Theme.of(this);

  Color dynamicColor({
    required final Color light,
    required final Color dark,
  }) {
    switch (MediaQuery.of(this).platformBrightness) {
      case Brightness.light:
        return light;
      case Brightness.dark:
        return dark;
    }
  }
}

extension TextStyleHelper on TextStyle {
  TextStyle c(Color color) => copyWith(color: color);
}

extension TextThemeHelper on ThemeData {
  TextStyle get tl => textTheme.titleLarge!;

  TextStyle get tm => textTheme.titleMedium!;

  TextStyle get tmm =>
      textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get ts => textTheme.titleSmall!;

  TextStyle get tsm =>
      textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get ls => textTheme.labelSmall!;

  TextStyle get lsm =>
      textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get bl => textTheme.bodyLarge!;

  TextStyle get blm =>
      textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get bm => textTheme.bodyMedium!;

  TextStyle get bmm =>
      textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get bs => textTheme.bodySmall!;

  TextStyle get bssm =>
      textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600);
}
