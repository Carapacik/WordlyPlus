import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/core/localization/localization.dart';
import 'package:wordly/src/feature/app/model/app_theme.dart';
import 'package:wordly/src/feature/settings/data/settings_repository.dart';

part 'settings_bloc.freezed.dart';

/// States for the [SettingsBloc].
@freezed
sealed class SettingsState with _$SettingsState {
  const SettingsState._();

  /// Idle state for the [SettingsBloc].
  const factory SettingsState.idle({
    /// The current locale.
    required Locale locale,

    /// The current dictionary.
    required Locale dictionary,

    /// The current theme mode.
    required AppTheme appTheme,
  }) = _IdleSettingsState;

  /// Processing state for the [SettingsBloc].
  const factory SettingsState.processing({
    /// The current locale.
    required Locale locale,

    /// The current dictionary.
    required Locale dictionary,

    /// The current theme mode.
    required AppTheme appTheme,
  }) = _ProcessingSettingsState;

  /// Error state for the [SettingsBloc].
  const factory SettingsState.error({
    /// The current locale.
    required Locale locale,

    /// The current dictionary.
    required Locale dictionary,

    /// The current theme mode.
    required AppTheme appTheme,

    /// The error message.
    required String message,
  }) = _ErrorSettingsState;
}

/// Events for the [SettingsBloc].
@freezed
sealed class SettingsEvent with _$SettingsEvent {
  /// Event to update the theme mode.
  const factory SettingsEvent.updateTheme({
    /// The new theme mode.
    required AppTheme appTheme,
  }) = _UpdateThemeSettingsEvent;

  /// Event to update the dictionary.
  const factory SettingsEvent.updateDictionary({
    /// The new locale.
    required Locale dictionary,
  }) = _UpdateDictionarySettingsEvent;

  /// Event to update the locale.
  const factory SettingsEvent.updateLocale({
    /// The new locale.
    required Locale locale,
  }) = _UpdateLocaleSettingsEvent;
}

/// {@template settings_bloc}
/// A [Bloc] that handles the settings.
/// {@endtemplate}
final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  /// {@macro settings_bloc}
  SettingsBloc({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(
          SettingsState.idle(
            appTheme: settingsRepository.fetchThemeFromCache() ?? AppTheme.defaultTheme,
            dictionary: settingsRepository.fetchDictionaryFromCache() ?? const Locale('en'),
            locale: settingsRepository.fetchLocaleFromCache() ?? Localization.computeDefaultLocale(),
          ),
        ) {
    on<SettingsEvent>(
      (event, emit) => event.map(
        updateTheme: (event) async => _updateTheme(event, emit),
        updateDictionary: (event) async => _updateDictionary(event, emit),
        updateLocale: (event) async => _updateLocale(event, emit),
      ),
    );
  }

  final SettingsRepository _settingsRepository;

  Future<void> _updateTheme(
    _UpdateThemeSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      _ProcessingSettingsState(
        appTheme: state.appTheme,
        dictionary: state.dictionary,
        locale: state.locale,
      ),
    );

    try {
      await _settingsRepository.setTheme(event.appTheme);

      emitter(
        SettingsState.idle(appTheme: event.appTheme, dictionary: state.dictionary, locale: state.locale),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          dictionary: state.dictionary,
          locale: state.locale,
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _updateDictionary(
    _UpdateDictionarySettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      _ProcessingSettingsState(
        appTheme: state.appTheme,
        dictionary: state.dictionary,
        locale: state.locale,
      ),
    );

    try {
      await _settingsRepository.setDictionary(event.dictionary);

      emitter(
        SettingsState.idle(appTheme: state.appTheme, dictionary: event.dictionary, locale: state.locale),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          dictionary: state.dictionary,
          locale: state.locale,
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _updateLocale(
    _UpdateLocaleSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      _ProcessingSettingsState(
        appTheme: state.appTheme,
        dictionary: state.dictionary,
        locale: state.locale,
      ),
    );

    try {
      await _settingsRepository.setLocale(event.locale);

      emitter(
        SettingsState.idle(appTheme: state.appTheme, dictionary: state.dictionary, locale: event.locale),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          dictionary: state.dictionary,
          locale: state.locale,
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
