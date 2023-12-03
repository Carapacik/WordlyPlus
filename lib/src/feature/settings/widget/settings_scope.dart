import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:wordly/src/feature/settings/bloc/settings_bloc.dart';
import 'package:wordly/src/feature/settings/model/app_theme.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template theme_scope_controller}
/// A controller that holds and operates the app theme.
/// {@endtemplate}
abstract interface class ThemeScopeController {
  /// Get the current [AppTheme].
  AppTheme get theme;

  /// Set the theme mode to [themeMode].
  void setThemeMode(ThemeMode themeMode);

  /// Set the color mode to [colorMode].
  void setColorMode(ColorMode colorMode);

  /// Set the theme other colors to [otherColors].
  void setOtherColors((Color, Color, Color) otherColors);

  /// Set the theme to [appTheme].
  void setTheme(AppTheme appTheme);
}

/// {@template locale_scope_controller}
/// A controller that holds and operates the app dictionary.
/// {@endtemplate}
abstract interface class DictionaryScopeController {
  /// Get the current [dictionary]
  Locale get dictionary;

  /// Set locale to [dictionary].
  void setDictionary(Locale dictionary);
}

/// {@template locale_scope_controller}
/// A controller that holds and operates the app locale.
/// {@endtemplate}
abstract interface class LocaleScopeController {
  /// Get the current [Locale]
  Locale get locale;

  /// Set locale to [locale].
  void setLocale(Locale locale);
}

/// {@template settings_scope_controller}
/// A controller that holds and operates the app settings.
/// {@endtemplate}
abstract interface class SettingsScopeController
    implements ThemeScopeController, DictionaryScopeController, LocaleScopeController {}

enum _SettingsScopeAspect {
  /// The theme aspect.
  theme,

  /// The dictionary aspect.
  dictionary,

  /// The locale aspect.
  locale;
}

/// {@template settings_scope}
/// Settings scope is responsible for handling settings-related stuff.
///
/// For example, it holds facilities to change
/// - theme seed color
/// - theme mode
/// - locale
/// {@endtemplate}
class SettingsScope extends StatefulWidget {
  /// {@macro settings_scope}
  const SettingsScope({required this.child, super.key});

  /// The child widget.
  final Widget child;

  /// Get the [SettingsScopeController] of the closest [SettingsScope] ancestor.
  static SettingsScopeController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      context.inhOf<_InheritedSettingsScope>(listen: listen).controller;

  /// Get the [ThemeScopeController] of the closest [SettingsScope] ancestor.
  static ThemeScopeController themeOf(BuildContext context) => context
      .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
        aspect: _SettingsScopeAspect.theme,
      )
      .controller;

  /// Get the [DictionaryScopeController] of the closest [SettingsScope] ancestor.
  static DictionaryScopeController dictionaryOf(BuildContext context) => context
      .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
        aspect: _SettingsScopeAspect.dictionary,
      )
      .controller;

  /// Get the [LocaleScopeController] of the closest [SettingsScope] ancestor.
  static LocaleScopeController localeOf(BuildContext context) => context
      .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
        aspect: _SettingsScopeAspect.locale,
      )
      .controller;

  @override
  State<SettingsScope> createState() => _SettingsScopeState();
}

/// State for widget SettingsScope
class _SettingsScopeState extends State<SettingsScope> implements SettingsScopeController {
  late final SettingsBloc _settingsBloc;

  @override
  void initState() {
    super.initState();
    _settingsBloc = SettingsBloc(
      settingsRepository: DependenciesScope.of(context).settingsRepository,
    );
  }

  @override
  void dispose() {
    unawaited(_settingsBloc.close());
    super.dispose();
  }

  @override
  void setLocale(Locale locale) {
    _settingsBloc.add(SettingsEvent.updateLocale(locale: locale));
  }

  @override
  void setDictionary(Locale dictionary) {
    _settingsBloc.add(SettingsEvent.updateDictionary(dictionary: dictionary));
  }

  @override
  void setThemeMode(ThemeMode themeMode) {
    _settingsBloc.add(
      SettingsEvent.updateTheme(
        appTheme: AppTheme(mode: themeMode, colorMode: theme.colorMode),
      ),
    );
  }

  @override
  void setColorMode(ColorMode colorMode) {
    _settingsBloc.add(
      SettingsEvent.updateTheme(
        appTheme: AppTheme(mode: theme.mode, colorMode: colorMode),
      ),
    );
  }

  @override
  void setOtherColors((Color, Color, Color) otherColors) {
    _settingsBloc.add(
      SettingsEvent.updateTheme(
        appTheme: AppTheme(mode: theme.mode, colorMode: theme.colorMode, otherColors: otherColors),
      ),
    );
  }

  @override
  void setTheme(AppTheme appTheme) {
    _settingsBloc.add(
      SettingsEvent.updateTheme(appTheme: appTheme),
    );
  }

  @override
  Locale get locale => _settingsBloc.state.locale;

  @override
  Locale get dictionary => _settingsBloc.state.dictionary;

  @override
  AppTheme get theme => _settingsBloc.state.appTheme;

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        bloc: _settingsBloc,
        builder: (context, state) => _InheritedSettingsScope(
          controller: this,
          state: state,
          child: widget.child,
        ),
      );
}

class _InheritedSettingsScope extends InheritedModel<_SettingsScopeAspect> {
  const _InheritedSettingsScope({
    required this.controller,
    required this.state,
    required super.child,
  });

  final SettingsScopeController controller;
  final SettingsState state;

  @override
  bool updateShouldNotify(_InheritedSettingsScope oldWidget) => state != oldWidget.state;

  @override
  bool updateShouldNotifyDependent(
    covariant _InheritedSettingsScope oldWidget,
    Set<_SettingsScopeAspect> dependencies,
  ) {
    var shouldNotify = false;

    if (dependencies.contains(_SettingsScopeAspect.theme)) {
      shouldNotify = shouldNotify || state.appTheme != oldWidget.state.appTheme;
    }

    if (dependencies.contains(_SettingsScopeAspect.locale)) {
      final locale = state.locale.languageCode;
      final oldLocale = oldWidget.state.locale.languageCode;

      shouldNotify = shouldNotify || locale != oldLocale;
    }

    return shouldNotify;
  }
}
