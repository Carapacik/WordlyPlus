import 'package:flutter/material.dart' show Locale;
import 'package:wordly/src/feature/app/model/app_theme.dart';
import 'package:wordly/src/feature/settings/data/dictionary_datasource.dart';
import 'package:wordly/src/feature/settings/data/locale_datasource.dart';
import 'package:wordly/src/feature/settings/data/theme_datasource.dart';

/// Settings repository
abstract interface class SettingsRepository {
  /// Set theme
  Future<void> setTheme(AppTheme theme);

  /// Set dictionary
  Future<void> setDictionary(Locale dictionary);

  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Observe theme mode changes
  AppTheme? fetchThemeFromCache();

  /// Observe dictionary changes
  Locale? fetchDictionaryFromCache();

  /// Observe locale changes
  Locale? fetchLocaleFromCache();
}

/// {@template settings_repository_impl}
/// Settings repository implementation
/// {@endtemplate}
final class SettingsRepositoryImpl implements SettingsRepository {
  /// {@macro settings_repository_impl}
  const SettingsRepositoryImpl({
    required ThemeDataSource themeDataSource,
    required DictionaryDataSource dictionaryDataSource,
    required LocaleDataSource localeDataSource,
  })  : _themeDataSource = themeDataSource,
        _dictionaryDataSource = dictionaryDataSource,
        _localeDataSource = localeDataSource;

  final ThemeDataSource _themeDataSource;
  final DictionaryDataSource _dictionaryDataSource;
  final LocaleDataSource _localeDataSource;

  @override
  Locale? fetchLocaleFromCache() => _localeDataSource.loadLocaleFromCache();

  @override
  Locale? fetchDictionaryFromCache() => _dictionaryDataSource.loadDictionaryFromCache();

  @override
  AppTheme? fetchThemeFromCache() => _themeDataSource.loadThemeFromCache();

  @override
  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);

  @override
  Future<void> setDictionary(Locale locale) => _dictionaryDataSource.setDictionary(locale);

  @override
  Future<void> setTheme(AppTheme theme) => _themeDataSource.setTheme(theme);
}
