// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocaleEvent {
  Locale get locale => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleEventCopyWith<LocaleEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleEventCopyWith<$Res> {
  factory $LocaleEventCopyWith(LocaleEvent value, $Res Function(LocaleEvent) then) =
      _$LocaleEventCopyWithImpl<$Res, LocaleEvent>;

  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class _$LocaleEventCopyWithImpl<$Res, $Val extends LocaleEvent> implements $LocaleEventCopyWith<$Res> {
  _$LocaleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocaleEventUpdateImplCopyWith<$Res> implements $LocaleEventCopyWith<$Res> {
  factory _$$LocaleEventUpdateImplCopyWith(_$LocaleEventUpdateImpl value, $Res Function(_$LocaleEventUpdateImpl) then) =
      __$$LocaleEventUpdateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LocaleEventUpdateImplCopyWithImpl<$Res> extends _$LocaleEventCopyWithImpl<$Res, _$LocaleEventUpdateImpl>
    implements _$$LocaleEventUpdateImplCopyWith<$Res> {
  __$$LocaleEventUpdateImplCopyWithImpl(_$LocaleEventUpdateImpl _value, $Res Function(_$LocaleEventUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$LocaleEventUpdateImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocaleEventUpdateImpl implements _LocaleEventUpdate {
  const _$LocaleEventUpdateImpl({required this.locale});

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocaleEvent.update(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleEventUpdateImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleEventUpdateImplCopyWith<_$LocaleEventUpdateImpl> get copyWith =>
      __$$LocaleEventUpdateImplCopyWithImpl<_$LocaleEventUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _LocaleEventUpdate implements LocaleEvent {
  const factory _LocaleEventUpdate({required final Locale locale}) = _$LocaleEventUpdateImpl;

  @override
  Locale get locale;

  @override
  @JsonKey(ignore: true)
  _$$LocaleEventUpdateImplCopyWith<_$LocaleEventUpdateImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocaleState {
  Locale get locale => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleStateIdle value) idle,
    required TResult Function(_LocaleStateInProgress value) inProgress,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleStateIdle value)? idle,
    TResult? Function(_LocaleStateInProgress value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleStateIdle value)? idle,
    TResult Function(_LocaleStateInProgress value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleStateCopyWith<LocaleState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleStateCopyWith<$Res> {
  factory $LocaleStateCopyWith(LocaleState value, $Res Function(LocaleState) then) =
      _$LocaleStateCopyWithImpl<$Res, LocaleState>;

  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class _$LocaleStateCopyWithImpl<$Res, $Val extends LocaleState> implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocaleStateIdleImplCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$$LocaleStateIdleImplCopyWith(_$LocaleStateIdleImpl value, $Res Function(_$LocaleStateIdleImpl) then) =
      __$$LocaleStateIdleImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LocaleStateIdleImplCopyWithImpl<$Res> extends _$LocaleStateCopyWithImpl<$Res, _$LocaleStateIdleImpl>
    implements _$$LocaleStateIdleImplCopyWith<$Res> {
  __$$LocaleStateIdleImplCopyWithImpl(_$LocaleStateIdleImpl _value, $Res Function(_$LocaleStateIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$LocaleStateIdleImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocaleStateIdleImpl implements _LocaleStateIdle {
  const _$LocaleStateIdleImpl({required this.locale});

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocaleState.idle(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleStateIdleImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleStateIdleImplCopyWith<_$LocaleStateIdleImpl> get copyWith =>
      __$$LocaleStateIdleImplCopyWithImpl<_$LocaleStateIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleStateIdle value) idle,
    required TResult Function(_LocaleStateInProgress value) inProgress,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleStateIdle value)? idle,
    TResult? Function(_LocaleStateInProgress value)? inProgress,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleStateIdle value)? idle,
    TResult Function(_LocaleStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _LocaleStateIdle implements LocaleState {
  const factory _LocaleStateIdle({required final Locale locale}) = _$LocaleStateIdleImpl;

  @override
  Locale get locale;

  @override
  @JsonKey(ignore: true)
  _$$LocaleStateIdleImplCopyWith<_$LocaleStateIdleImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocaleStateInProgressImplCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$$LocaleStateInProgressImplCopyWith(
          _$LocaleStateInProgressImpl value, $Res Function(_$LocaleStateInProgressImpl) then) =
      __$$LocaleStateInProgressImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LocaleStateInProgressImplCopyWithImpl<$Res>
    extends _$LocaleStateCopyWithImpl<$Res, _$LocaleStateInProgressImpl>
    implements _$$LocaleStateInProgressImplCopyWith<$Res> {
  __$$LocaleStateInProgressImplCopyWithImpl(
      _$LocaleStateInProgressImpl _value, $Res Function(_$LocaleStateInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$LocaleStateInProgressImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocaleStateInProgressImpl implements _LocaleStateInProgress {
  const _$LocaleStateInProgressImpl({required this.locale});

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocaleState.inProgress(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleStateInProgressImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleStateInProgressImplCopyWith<_$LocaleStateInProgressImpl> get copyWith =>
      __$$LocaleStateInProgressImplCopyWithImpl<_$LocaleStateInProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleStateIdle value) idle,
    required TResult Function(_LocaleStateInProgress value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleStateIdle value)? idle,
    TResult? Function(_LocaleStateInProgress value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleStateIdle value)? idle,
    TResult Function(_LocaleStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _LocaleStateInProgress implements LocaleState {
  const factory _LocaleStateInProgress({required final Locale locale}) = _$LocaleStateInProgressImpl;

  @override
  Locale get locale;

  @override
  @JsonKey(ignore: true)
  _$$LocaleStateInProgressImplCopyWith<_$LocaleStateInProgressImpl> get copyWith => throw _privateConstructorUsedError;
}
