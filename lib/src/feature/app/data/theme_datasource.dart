import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show Color, ThemeMode;
import 'package:wordly/src/core/utils/preferences_dao.dart';
import 'package:wordly/src/feature/app/model/app_theme.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template theme_datasource}
/// [ThemeDataSource] is an entry point to the theme data layer.
///
/// This is used to set and get theme.
/// {@endtemplate}
abstract interface class ThemeDataSource {
  /// Set theme
  Future<void> setTheme(AppTheme theme);

  /// Get current theme from cache
  AppTheme? loadThemeFromCache();
}

/// {@macro theme_datasource}
final class ThemeDataSourceImpl extends PreferencesDao implements ThemeDataSource {
  /// {@macro theme_datasource}
  ThemeDataSourceImpl(super._sharedPreferences);

  PreferencesEntry<String> get _themeMode => stringEntry('theme.mode');

  PreferencesEntry<int> get _colorMode => intEntry('theme.colorMode');

  PreferencesEntry<int> get _otherColor1 => intEntry('theme.otherColor1');

  PreferencesEntry<int> get _otherColor2 => intEntry('theme.otherColor2');

  PreferencesEntry<int> get _otherColor3 => intEntry('theme.otherColor3');

  @override
  Future<void> setTheme(AppTheme theme) async {
    await _themeMode.setIfNullRemove(_themeModeCodec.encode(theme.mode));
    await _colorMode.setIfNullRemove(theme.colorMode.index);
    if (theme.otherColors != null) {
      await _otherColor1.setIfNullRemove(theme.otherColors?.$1.value);
      await _otherColor2.setIfNullRemove(theme.otherColors?.$2.value);
      await _otherColor3.setIfNullRemove(theme.otherColors?.$3.value);
    }
  }

  @override
  AppTheme? loadThemeFromCache() {
    final themeMode = _themeMode.read();
    final colorModeIndex = _colorMode.read();

    if (themeMode == null || colorModeIndex == null) {
      return null;
    }
    final otherColor1 = _otherColor1.read();
    final otherColor2 = _otherColor2.read();
    final otherColor3 = _otherColor3.read();

    (Color, Color, Color)? otherColors;
    if (otherColor1 != null && otherColor2 != null && otherColor3 != null) {
      otherColors = (Color(otherColor1), Color(otherColor2), Color(otherColor3));
    }

    return AppTheme(
      mode: _themeModeCodec.decode(themeMode),
      colorMode: ColorMode.values[colorModeIndex],
      otherColors: otherColors,
    );
  }
}

const _themeModeCodec = _ThemeModeCodec();

final class _ThemeModeCodec extends Codec<ThemeMode, String> {
  const _ThemeModeCodec();

  @override
  Converter<String, ThemeMode> get decoder => const _ThemeModeDecoder();

  @override
  Converter<ThemeMode, String> get encoder => const _ThemeModeEncoder();
}

final class _ThemeModeDecoder extends Converter<String, ThemeMode> {
  const _ThemeModeDecoder();

  @override
  ThemeMode convert(String input) {
    switch (input) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        throw ArgumentError.value(
          input,
          'input',
          'Cannot convert $input to ThemeMode',
        );
    }
  }
}

final class _ThemeModeEncoder extends Converter<ThemeMode, String> {
  const _ThemeModeEncoder();

  @override
  String convert(ThemeMode input) {
    switch (input) {
      case ThemeMode.dark:
        return 'ThemeMode.dark';
      case ThemeMode.light:
        return 'ThemeMode.light';
      case ThemeMode.system:
        return 'ThemeMode.system';
    }
  }
}
