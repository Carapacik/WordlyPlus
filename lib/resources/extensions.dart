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

extension TextThemeHelper on ThemeData {
  TextStyle get tl => textTheme.titleLarge!;

  TextStyle get tm => textTheme.titleMedium!;

  TextStyle get bl => textTheme.bodyLarge!;

  TextStyle get ll => textTheme.labelLarge!;
}
