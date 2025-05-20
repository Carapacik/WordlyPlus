import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/src/core/common/color_codec.dart';
import 'package:wordly/src/core/common/persisted_entry.dart';
import 'package:wordly/src/feature/settings/data/color_mode_codec.dart';
import 'package:wordly/src/feature/settings/data/theme_mode_codec.dart';
import 'package:wordly/src/feature/settings/model/app_settings.dart';
import 'package:wordly/src/feature/settings/model/app_theme.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template app_settings_datasource}
/// [AppSettingsDatasource] sets and gets app settings.
/// {@endtemplate}
abstract interface class AppSettingsDatasource {
  /// Set app settings
  Future<void> setAppSettings(AppSettings appSettings);

  /// Load [AppSettings] from the source of truth.
  Future<AppSettings?> getAppSettings();
}

/// {@macro app_settings_datasource}
final class AppSettingsDatasourceImpl implements AppSettingsDatasource {
  /// {@macro app_settings_datasource}
  AppSettingsDatasourceImpl({required this.sharedPreferences});

  /// The instance of [SharedPreferences] used to read and write values.
  final SharedPreferencesAsync sharedPreferences;

  late final _appSettings = AppSettingsPersistedEntry(sharedPreferences: sharedPreferences, key: 'settings');

  @override
  Future<AppSettings?> getAppSettings() => _appSettings.read();

  @override
  Future<void> setAppSettings(AppSettings appSettings) => _appSettings.set(appSettings);
}

/// Persisted entry for [AppSettings]
class AppSettingsPersistedEntry extends SharedPreferencesEntry<AppSettings> {
  /// Create [AppSettingsPersistedEntry]
  AppSettingsPersistedEntry({required super.sharedPreferences, required super.key});

  late final _themeMode = StringPreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.themeMode');

  late final _colorMode = StringPreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.colorMode');

  late final _localeLanguageCode = StringPreferencesEntry(
    sharedPreferences: sharedPreferences,
    key: '$key.locale.languageCode',
  );

  late final _localeCountryCode = StringPreferencesEntry(
    sharedPreferences: sharedPreferences,
    key: '$key.locale.countryCode',
  );

  late final _dictionaryLanguageCode = StringPreferencesEntry(
    sharedPreferences: sharedPreferences,
    key: '$key.dictionary.languageCode',
  );

  late final _dictionaryCountryCode = StringPreferencesEntry(
    sharedPreferences: sharedPreferences,
    key: '$key.dictionary.countryCode',
  );

  late final _textScale = DoublePreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.textScale');

  IntPreferencesEntry _otherColor1(int index) =>
      IntPreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.otherColor.1.$index');

  IntPreferencesEntry _otherColor2(int index) =>
      IntPreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.otherColor.2.$index');

  IntPreferencesEntry _otherColor3(int index) =>
      IntPreferencesEntry(sharedPreferences: sharedPreferences, key: '$key.otherColor.3.$index');

  static const _colorCodec = ColorCodec();

  @override
  Future<AppSettings?> read() async {
    final themeModeFuture = _themeMode.read();
    final colorModeFuture = _colorMode.read();
    final localeLanguageCodeFuture = _localeLanguageCode.read();
    final countryCodeFuture = _localeCountryCode.read();
    final dictionaryLanguageCodeFuture = _dictionaryLanguageCode.read();
    final dictionaryCountryCodeFuture = _dictionaryCountryCode.read();
    final textScaleFuture = _textScale.read();

    final themeMode = await themeModeFuture;
    final colorMode = await colorModeFuture;
    final languageCode = await localeLanguageCodeFuture;
    final countryCode = await countryCodeFuture;
    final dictionaryLanguageCode = await dictionaryLanguageCodeFuture;
    final dictionaryCountryCode = await dictionaryCountryCodeFuture;
    final textScale = await textScaleFuture;

    if (themeMode == null &&
        colorMode == null &&
        languageCode == null &&
        countryCode == null &&
        dictionaryLanguageCode == null &&
        dictionaryCountryCode == null &&
        textScale == null) {
      return null;
    }

    AppTheme? appTheme;

    if (themeMode != null && colorMode != null) {
      final decodedThemeMode = const ThemeModeCodec().decode(themeMode);
      final decodedColorMode = const ColorModeCodec().decode(colorMode);
      final otherColors1 = await _otherColor1(decodedThemeMode.index).read();
      final otherColors2 = await _otherColor2(decodedThemeMode.index).read();
      final otherColors3 = await _otherColor3(decodedThemeMode.index).read();

      (Color, Color, Color)? otherColors;
      if (otherColors1 != null && otherColors2 != null && otherColors3 != null) {
        otherColors = (
          _colorCodec.decode(otherColors1),
          _colorCodec.decode(otherColors2),
          _colorCodec.decode(otherColors3),
        );
      }
      appTheme = AppTheme(themeMode: decodedThemeMode, colorMode: decodedColorMode, otherColors: otherColors);
    }

    Locale? appLocale;
    Locale? appDictionary;

    if (languageCode != null) {
      appLocale = Locale(languageCode, countryCode);
    }

    if (dictionaryLanguageCode != null) {
      appDictionary = Locale(dictionaryLanguageCode, dictionaryCountryCode);
    }

    return AppSettings(
      appTheme: appTheme ?? AppTheme(themeMode: ThemeMode.system, colorMode: ColorMode.casual),
      locale: appLocale ?? const Locale('en'),
      dictionary: appDictionary ?? const Locale('en'),
      textScale: textScale ?? 1,
    );
  }

  @override
  Future<void> remove() async {
    await [
      _themeMode.remove(),
      _colorMode.remove(),
      _localeLanguageCode.remove(),
      _localeCountryCode.remove(),
      _dictionaryLanguageCode.remove(),
      _dictionaryCountryCode.remove(),
      _textScale.remove(),
      for (final themeMode in ThemeMode.values) _otherColor1(themeMode.index).remove(),
      for (final themeMode in ThemeMode.values) _otherColor2(themeMode.index).remove(),
      for (final themeMode in ThemeMode.values) _otherColor3(themeMode.index).remove(),
    ].wait;
  }

  @override
  Future<void> set(AppSettings value) async {
    await [
      _themeMode.set(const ThemeModeCodec().encode(value.appTheme.themeMode)),
      _colorMode.set(const ColorModeCodec().encode(value.appTheme.colorMode)),
      if (value.appTheme.otherColors != null) ...[
        _otherColor1(value.appTheme.themeMode.index).set(_colorCodec.encode(value.appTheme.otherColors!.$1)),
        _otherColor2(value.appTheme.themeMode.index).set(_colorCodec.encode(value.appTheme.otherColors!.$2)),
        _otherColor3(value.appTheme.themeMode.index).set(_colorCodec.encode(value.appTheme.otherColors!.$3)),
      ],
    ].wait;

    if (value.locale != null) {
      await [
        _localeLanguageCode.set(value.locale!.languageCode),
        _localeCountryCode.set(value.locale!.countryCode ?? ''),
      ].wait;
    }

    if (value.dictionary != null) {
      await [
        _dictionaryLanguageCode.set(value.dictionary!.languageCode),
        _dictionaryCountryCode.set(value.dictionary!.countryCode ?? ''),
      ].wait;
    }

    if (value.textScale != null) {
      await _textScale.set(value.textScale!);
    }
  }
}
