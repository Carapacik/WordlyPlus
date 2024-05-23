import 'dart:ui' show Locale;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/feature/settings/data/dictionary_repository.dart';
import 'package:wordly/src/feature/settings/data/locale_repository.dart';
import 'package:wordly/src/feature/settings/data/theme_repository.dart';

/// {@template settings_bloc}
/// A [Bloc] that handles the settings.
/// {@endtemplate}
final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  /// {@macro settings_bloc}
  SettingsBloc({
    required LocaleRepository localeRepository,
    required ThemeRepository themeRepository,
    required DictionaryRepository dictionaryRepository,
    required SettingsState initialState,
  })  : _localeRepository = localeRepository,
        _themeRepository = themeRepository,
        _dictionaryRepository = dictionaryRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) async => switch (event) {
        final _UpdateLocaleSettingsEvent e => _updateLocale(e, emit),
        final _UpdateDictionarySettingsEvent e => _updateDictionary(e, emit),
        final _UpdateThemeSettingsEvent e => _updateTheme(e, emit),
      },
    );
  }

  final LocaleRepository _localeRepository;
  final ThemeRepository _themeRepository;
  final DictionaryRepository _dictionaryRepository;

  Future<void> _updateTheme(_UpdateThemeSettingsEvent event, Emitter<SettingsState> emitter) async {
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

  Future<void> _updateLocale(_UpdateLocaleSettingsEvent event, Emitter<SettingsState> emitter) async {
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
        SettingsState.idle(appTheme: state.appTheme, locale: event.locale, dictionary: state.dictionary),
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

  Future<void> _updateDictionary(_UpdateDictionarySettingsEvent event, Emitter<SettingsState> emitter) async {
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
}

/// States for the [SettingsBloc].
sealed class SettingsState {
  const SettingsState({this.locale, this.dictionary, this.appTheme});

  /// Idle state for the [SettingsBloc].
  const factory SettingsState.idle({Locale? locale, Locale? dictionary, AppTheme? appTheme}) = _IdleSettingsState;

  /// Processing state for the [SettingsBloc].
  const factory SettingsState.processing({Locale? locale, Locale? dictionary, AppTheme? appTheme}) =
      _ProcessingSettingsState;

  /// Error state for the [SettingsBloc].
  const factory SettingsState.error({
    required Object cause,
    Locale? locale,
    Locale? dictionary,
    AppTheme? appTheme,
  }) = _ErrorSettingsState;

  /// Application locale.
  final Locale? locale;

  /// Application dictionary.
  final Locale? dictionary;

  /// Data class used to represent the state of theme.
  final AppTheme? appTheme;
}

@immutable
final class _IdleSettingsState extends SettingsState {
  const _IdleSettingsState({super.locale, super.dictionary, super.appTheme});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _IdleSettingsState &&
        other.locale == locale &&
        other.dictionary == dictionary &&
        other.appTheme == appTheme;
  }

  @override
  int get hashCode => Object.hash(locale, dictionary, appTheme);

  @override
  String toString() => 'SettingsState.idle(locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
}

@immutable
final class _ProcessingSettingsState extends SettingsState {
  const _ProcessingSettingsState({super.locale, super.dictionary, super.appTheme});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _ProcessingSettingsState &&
        other.locale == locale &&
        other.dictionary == dictionary &&
        other.appTheme == appTheme;
  }

  @override
  int get hashCode => Object.hash(locale, dictionary, appTheme);

  @override
  String toString() => 'SettingsState.processing(locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
}

@immutable
final class _ErrorSettingsState extends SettingsState {
  const _ErrorSettingsState({
    required this.cause,
    super.locale,
    super.dictionary,
    super.appTheme,
  });

  /// The cause of the error.
  final Object cause;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _ErrorSettingsState &&
        other.cause == cause &&
        other.locale == locale &&
        other.dictionary == dictionary &&
        other.appTheme == appTheme;
  }

  @override
  int get hashCode => Object.hash(cause, locale, dictionary, appTheme);

  @override
  String toString() => 'SettingsState.error(cause: $cause, '
      'locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
}

/// Events for the [SettingsBloc].
sealed class SettingsEvent {
  const SettingsEvent();

  /// Event to update theme.
  const factory SettingsEvent.updateTheme({required AppTheme appTheme}) = _UpdateThemeSettingsEvent;

  /// Event to update the locale.
  const factory SettingsEvent.updateLocale({required Locale locale}) = _UpdateLocaleSettingsEvent;

  /// Event to update the dictionary.
  const factory SettingsEvent.updateDictionary({required Locale dictionary}) = _UpdateDictionarySettingsEvent;
}

@immutable
final class _UpdateThemeSettingsEvent extends SettingsEvent {
  const _UpdateThemeSettingsEvent({required this.appTheme});

  /// The theme to update.
  final AppTheme appTheme;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _UpdateThemeSettingsEvent && other.appTheme == appTheme;
  }

  @override
  int get hashCode => appTheme.hashCode;

  @override
  String toString() => 'SettingsEvent.updateTheme(appTheme: $appTheme)';
}

@immutable
final class _UpdateLocaleSettingsEvent extends SettingsEvent {
  const _UpdateLocaleSettingsEvent({required this.locale});

  /// The locale to update.
  final Locale locale;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _UpdateLocaleSettingsEvent && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;

  @override
  String toString() => 'SettingsEvent.updateLocale(locale: $locale)';
}

@immutable
final class _UpdateDictionarySettingsEvent extends SettingsEvent {
  const _UpdateDictionarySettingsEvent({required this.dictionary});

  /// The dictionary to update.
  final Locale dictionary;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is _UpdateDictionarySettingsEvent && other.dictionary == dictionary;
  }

  @override
  int get hashCode => dictionary.hashCode;

  @override
  String toString() => 'SettingsEvent.updateDictionary(dictionary: $dictionary)';
}
