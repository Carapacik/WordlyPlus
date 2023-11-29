import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/core/utils/extensions/context_extension.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template app_theme}
/// An immutable class that holds properties needed
/// to build a [ThemeData] for the app.
/// {@endtemplate}
@immutable
final class AppTheme with Diagnosticable {
  /// {@macro app_theme}
  AppTheme({
    required this.mode,
    required this.colorMode,
    this.otherColors,
  })  : darkTheme = ThemeData(
          colorSchemeSeed: otherColors?.$1 ?? AppColors.green,
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: 'Nunito',
        ),
        lightTheme = ThemeData(
          colorSchemeSeed: otherColors?.$1 ?? AppColors.green,
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: 'Nunito',
        );

  /// The type of theme to use.
  final ThemeMode mode;

  /// The type of color mode to use.
  final ColorMode colorMode;

  /// Other colors for cells
  final (Color, Color, Color)? otherColors;

  /// The dark [ThemeData] for this [AppTheme].
  final ThemeData darkTheme;

  /// The light [ThemeData] for this [AppTheme].
  final ThemeData lightTheme;

  /// The default [AppTheme].
  static final defaultTheme = AppTheme(
    mode: ThemeMode.system,
    colorMode: ColorMode.casual,
  );

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [mode].
  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }

  bool isDarkTheme(BuildContext context) => context.theme.brightness == Brightness.dark;

  Color get correctColor {
    switch (colorMode) {
      case ColorMode.casual:
        return AppColors.green;
      case ColorMode.highContrast:
        return AppColors.orange;
      case ColorMode.other:
        return otherColors?.$1 ?? AppColors.green;
    }
  }

  Color get wrongSpotColor {
    switch (colorMode) {
      case ColorMode.casual:
        return AppColors.yellow;
      case ColorMode.highContrast:
        return AppColors.blue;
      case ColorMode.other:
        return otherColors?.$2 ?? AppColors.yellow;
    }
  }

  Color notInWordColor(BuildContext context) {
    final isDark = isDarkTheme(context);
    switch (colorMode) {
      case ColorMode.casual:
      case ColorMode.highContrast:
        return isDark ? AppColors.tertiary : AppColors.grey;
      case ColorMode.other:
        return otherColors?.$3 ?? (isDark ? AppColors.tertiary : AppColors.grey);
    }
  }

  Color unknownColor(BuildContext context) {
    return isDarkTheme(context) ? AppColors.grey : AppColors.tertiary;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme &&
          runtimeType == other.runtimeType &&
          mode == other.mode &&
          colorMode == other.colorMode &&
          otherColors == other.otherColors;

  @override
  int get hashCode => mode.hashCode ^ colorMode.hashCode ^ otherColors.hashCode;

  AppTheme copyWith({
    ThemeMode? themeMode,
    ColorMode? colorMode,
    (Color, Color, Color)? otherColors,
  }) {
    return AppTheme(
      mode: themeMode ?? mode,
      colorMode: colorMode ?? this.colorMode,
      otherColors: otherColors ?? this.otherColors,
    );
  }
}
