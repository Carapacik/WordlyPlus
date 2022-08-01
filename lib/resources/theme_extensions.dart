import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/resources/l10n.dart';

extension ContextHelper on BuildContext {
  R get r => R.of(this);

  ThemeData get theme => Theme.of(this);

  Color dynamicColor({
    required Color light,
    required Color dark,
  }) =>
      read<ThemeBloc>().state.isDarkTheme ? dark : light;
}

extension TextThemeHelper on ThemeData {
  TextStyle get tl => textTheme.titleLarge!;

  TextStyle get tm => textTheme.titleMedium!;

  TextStyle get bl => textTheme.bodyLarge!;

  TextStyle get ll => textTheme.labelLarge!;
}
