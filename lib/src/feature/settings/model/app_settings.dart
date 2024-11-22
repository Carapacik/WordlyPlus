import 'dart:ui' show Locale;

import 'package:flutter/foundation.dart';
import 'package:wordly/src/feature/initialization/model/app_theme.dart';

/// {@template app_settings}
/// Application settings
/// {@endtemplate}
@immutable
class AppSettings with Diagnosticable {
  /// {@macro app_settings}
  const AppSettings({
    required this.appTheme,
    this.locale = const Locale('en'),
    this.dictionary = const Locale('en'),
    this.textScale = 1,
  });

  /// The theme of the app,
  final AppTheme appTheme;

  /// The locale of the app.
  final Locale locale;

  /// The dictionary of the app.
  final Locale dictionary;

  /// The text scale of the app.
  final double textScale;

  /// Copy the [AppSettings] with new values.
  AppSettings copyWith({
    AppTheme? appTheme,
    Locale? locale,
    Locale? dictionary,
    double? textScale,
  }) =>
      AppSettings(
        appTheme: appTheme ?? this.appTheme,
        locale: locale ?? this.locale,
        dictionary: dictionary ?? this.dictionary,
        textScale: textScale ?? this.textScale,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppSettings &&
        other.appTheme == appTheme &&
        other.locale == locale &&
        other.dictionary == dictionary &&
        other.textScale == textScale;
  }

  @override
  int get hashCode => Object.hash(appTheme, locale, dictionary, textScale);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<AppTheme>('appTheme', appTheme))
      ..add(DiagnosticsProperty<Locale>('locale', locale))
      ..add(DiagnosticsProperty<Locale>('dictionary', dictionary))
      ..add(DoubleProperty('textScale', textScale));
    super.debugFillProperties(properties);
  }
}
