import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/feature/settings/data/dictionary_repository.dart';
import 'package:wordly/src/feature/settings/data/locale_repository.dart';
import 'package:wordly/src/feature/settings/data/theme_repository.dart';

part 'settings_bloc.freezed.dart';

/// States for the [SettingsBloc].
@Freezed()
sealed class SettingsState with _$SettingsState {
  const SettingsState._();

  /// Idle state for the [SettingsBloc].
  const factory SettingsState.idle({
    /// The current locale.
    Locale? locale,

    /// The current dictionary.
    Locale? dictionary,

    /// The current theme mode.
    AppTheme? appTheme,
  }) = _IdleSettingsState;

  /// Processing state for the [SettingsBloc].
  const factory SettingsState.processing({
    /// The current locale.
    Locale? locale,

    /// The current dictionary.
    Locale? dictionary,

    /// The current theme mode.
    AppTheme? appTheme,
  }) = _ProcessingSettingsState;

  /// Error state for the [SettingsBloc].
  const factory SettingsState.error({
    /// The error message.
    required Object cause,

    /// The current locale.
    Locale? locale,

    /// The current dictionary.
    Locale? dictionary,

    /// The current theme mode.
    AppTheme? appTheme,
  }) = _ErrorSettingsState;
}

/// Events for the [SettingsBloc].
@Freezed(copyWith: false)
sealed class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();

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
  SettingsBloc({
    required LocaleRepository localeRepository,
    required DictionaryRepository dictionaryRepository,
    required ThemeRepository themeRepository,
    required SettingsState initialState,
  })  : _localeRepository = localeRepository,
        _dictionaryRepository = dictionaryRepository,
        _themeRepository = themeRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) async => event.map(
        updateTheme: (event) => _updateTheme(event, emit),
        updateLocale: (event) => _updateLocale(event, emit),
        updateDictionary: (event) => _updateDictionary(event, emit),
      ),
    );
  }

  final LocaleRepository _localeRepository;
  final DictionaryRepository _dictionaryRepository;
  final ThemeRepository _themeRepository;

  Future<void> _updateTheme(
    _UpdateThemeSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      SettingsState.processing(
        appTheme: state.appTheme,
        locale: state.locale,
        dictionary: state.dictionary,
      ),
    );

    try {
      await _themeRepository.setTheme(event.appTheme);

      emitter(
        SettingsState.idle(appTheme: event.appTheme, locale: state.locale, dictionary: state.dictionary),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          dictionary: state.dictionary,
          cause: e,
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
      SettingsState.processing(
        appTheme: state.appTheme,
        locale: state.locale,
        dictionary: state.dictionary,
      ),
    );

    try {
      await _dictionaryRepository.setDictionary(event.dictionary);

      emitter(
        SettingsState.idle(appTheme: state.appTheme, locale: state.locale, dictionary: event.dictionary),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          dictionary: state.dictionary,
          cause: e,
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
      SettingsState.processing(
        appTheme: state.appTheme,
        locale: state.locale,
        dictionary: state.dictionary,
      ),
    );

    try {
      await _localeRepository.setLocale(event.locale);

      emitter(
        SettingsState.idle(
          appTheme: state.appTheme,
          locale: event.locale,
          dictionary: state.dictionary,
        ),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          dictionary: state.dictionary,
          cause: e,
        ),
      );
      rethrow;
    }
  }
}
