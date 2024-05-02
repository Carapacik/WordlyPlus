import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show Color, ThemeMode;
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/core/utils/preferences_dao.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template theme_datasource}
/// [ThemeDataSource] is a data source that provides theme data.
///
/// This is used to set and get theme.
/// {@endtemplate}
abstract interface class ThemeDataSource {
  /// Set theme
  Future<void> setTheme(AppTheme theme);

  /// Get current theme from cache
  Future<AppTheme?> getTheme();
}

/// {@macro theme_datasource}
final class ThemeDataSourceLocal extends PreferencesDao implements ThemeDataSource {
  /// {@macro theme_datasource}
  const ThemeDataSourceLocal({
    required super.sharedPreferences,
    required this.themeModeCodec,
    required this.colorModeCodec,
  });

  final Codec<ThemeMode, String> themeModeCodec;
  final Codec<ColorMode, String> colorModeCodec;

  PreferencesEntry<String> get _themeMode => stringEntry('theme.mode');

  PreferencesEntry<String> get _colorMode => stringEntry('theme.color_mode');

  PreferencesEntry<int> _otherColor1(int index) => intEntry('theme.other_color1_$index');

  PreferencesEntry<int> _otherColor2(int index) => intEntry('theme.other_color2_$index');

  PreferencesEntry<int> _otherColor3(int index) => intEntry('theme.other_color3_$index');

  @override
  Future<void> setTheme(AppTheme theme) async {
    await _themeMode.setIfNullRemove(themeModeCodec.encode(theme.mode));
    await _colorMode.setIfNullRemove(colorModeCodec.encode(theme.colorMode));
    if (theme.otherColors != null) {
      await _otherColor1(theme.mode.index).setIfNullRemove(theme.otherColors?.$1.value);
      await _otherColor2(theme.mode.index).setIfNullRemove(theme.otherColors?.$2.value);
      await _otherColor3(theme.mode.index).setIfNullRemove(theme.otherColors?.$3.value);
    }
  }

  @override
  Future<AppTheme?> getTheme() async {
    final themeMode = _themeMode.read();
    final colorMode = _colorMode.read();

    if (themeMode == null || colorMode == null) {
      return null;
    }
    final decodedThemeMode = themeModeCodec.decode(themeMode);
    final decodedColorMode = colorModeCodec.decode(colorMode);
    final otherColor1 = _otherColor1(decodedThemeMode.index).read();
    final otherColor2 = _otherColor2(decodedThemeMode.index).read();
    final otherColor3 = _otherColor3(decodedThemeMode.index).read();

    (Color, Color, Color)? otherColors;
    if (otherColor1 != null && otherColor2 != null && otherColor3 != null) {
      otherColors = (Color(otherColor1), Color(otherColor2), Color(otherColor3));
    }

    return AppTheme(
      mode: decodedThemeMode,
      colorMode: decodedColorMode,
      otherColors: otherColors,
    );
  }
}
