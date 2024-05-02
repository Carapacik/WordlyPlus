// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  /// The current locale.
  Locale? get locale => throw _privateConstructorUsedError;

  /// The current dictionary.
  Locale? get dictionary => throw _privateConstructorUsedError;

  /// The current theme mode.
  AppTheme? get appTheme => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$IdleSettingsStateImpl extends _IdleSettingsState {
  const _$IdleSettingsStateImpl({this.locale, this.dictionary, this.appTheme}) : super._();

  /// The current locale.
  @override
  final Locale? locale;

  /// The current dictionary.
  @override
  final Locale? dictionary;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.idle(locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleSettingsStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.appTheme, appTheme) || other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, dictionary, appTheme);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleSettingsState extends SettingsState {
  const factory _IdleSettingsState({final Locale? locale, final Locale? dictionary, final AppTheme? appTheme}) =
      _$IdleSettingsStateImpl;

  const _IdleSettingsState._() : super._();

  @override

  /// The current locale.
  Locale? get locale;

  @override

  /// The current dictionary.
  Locale? get dictionary;

  @override

  /// The current theme mode.
  AppTheme? get appTheme;
}

/// @nodoc

class _$ProcessingSettingsStateImpl extends _ProcessingSettingsState {
  const _$ProcessingSettingsStateImpl({this.locale, this.dictionary, this.appTheme}) : super._();

  /// The current locale.
  @override
  final Locale? locale;

  /// The current dictionary.
  @override
  final Locale? dictionary;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.processing(locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingSettingsStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.appTheme, appTheme) || other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, dictionary, appTheme);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _ProcessingSettingsState extends SettingsState {
  const factory _ProcessingSettingsState({final Locale? locale, final Locale? dictionary, final AppTheme? appTheme}) =
      _$ProcessingSettingsStateImpl;

  const _ProcessingSettingsState._() : super._();

  @override

  /// The current locale.
  Locale? get locale;

  @override

  /// The current dictionary.
  Locale? get dictionary;

  @override

  /// The current theme mode.
  AppTheme? get appTheme;
}

/// @nodoc

class _$ErrorSettingsStateImpl extends _ErrorSettingsState {
  const _$ErrorSettingsStateImpl({required this.cause, this.locale, this.dictionary, this.appTheme}) : super._();

  /// The error message.
  @override
  final Object cause;

  /// The current locale.
  @override
  final Locale? locale;

  /// The current dictionary.
  @override
  final Locale? dictionary;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.error(cause: $cause, locale: $locale, dictionary: $dictionary, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSettingsStateImpl &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.appTheme, appTheme) || other.appTheme == appTheme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cause), locale, dictionary, appTheme);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSettingsState extends SettingsState {
  const factory _ErrorSettingsState(
      {required final Object cause,
      final Locale? locale,
      final Locale? dictionary,
      final AppTheme? appTheme}) = _$ErrorSettingsStateImpl;

  const _ErrorSettingsState._() : super._();

  /// The error message.
  Object get cause;

  @override

  /// The current locale.
  Locale? get locale;

  @override

  /// The current dictionary.
  Locale? get dictionary;

  @override

  /// The current theme mode.
  AppTheme? get appTheme;
}

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateDictionarySettingsEvent value) updateDictionary,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateThemeSettingsEventImpl extends _UpdateThemeSettingsEvent {
  const _$UpdateThemeSettingsEventImpl({required this.appTheme}) : super._();

  /// The new theme mode.
  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'SettingsEvent.updateTheme(appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateThemeSettingsEventImpl &&
            (identical(other.appTheme, appTheme) || other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateDictionarySettingsEvent value) updateDictionary,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) {
    return updateTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class _UpdateThemeSettingsEvent extends SettingsEvent {
  const factory _UpdateThemeSettingsEvent({required final AppTheme appTheme}) = _$UpdateThemeSettingsEventImpl;

  const _UpdateThemeSettingsEvent._() : super._();

  /// The new theme mode.
  AppTheme get appTheme;
}

/// @nodoc

class _$UpdateDictionarySettingsEventImpl extends _UpdateDictionarySettingsEvent {
  const _$UpdateDictionarySettingsEventImpl({required this.dictionary}) : super._();

  /// The new locale.
  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'SettingsEvent.updateDictionary(dictionary: $dictionary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDictionarySettingsEventImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateDictionarySettingsEvent value) updateDictionary,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) {
    return updateDictionary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) {
    return updateDictionary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) {
    if (updateDictionary != null) {
      return updateDictionary(this);
    }
    return orElse();
  }
}

abstract class _UpdateDictionarySettingsEvent extends SettingsEvent {
  const factory _UpdateDictionarySettingsEvent({required final Locale dictionary}) =
      _$UpdateDictionarySettingsEventImpl;

  const _UpdateDictionarySettingsEvent._() : super._();

  /// The new locale.
  Locale get dictionary;
}

/// @nodoc

class _$UpdateLocaleSettingsEventImpl extends _UpdateLocaleSettingsEvent {
  const _$UpdateLocaleSettingsEventImpl({required this.locale}) : super._();

  /// The new locale.
  @override
  final Locale locale;

  @override
  String toString() {
    return 'SettingsEvent.updateLocale(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLocaleSettingsEventImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateDictionarySettingsEvent value) updateDictionary,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) {
    return updateLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) {
    return updateLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateDictionarySettingsEvent value)? updateDictionary,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocaleSettingsEvent extends SettingsEvent {
  const factory _UpdateLocaleSettingsEvent({required final Locale locale}) = _$UpdateLocaleSettingsEventImpl;

  const _UpdateLocaleSettingsEvent._() : super._();

  /// The new locale.
  Locale get locale;
}
