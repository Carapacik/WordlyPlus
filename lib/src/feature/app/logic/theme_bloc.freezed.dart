// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeEvent {
  AppTheme get theme => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeEventCopyWith<ThemeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
  @useResult
  $Res call({AppTheme theme});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeEventUpdateImplCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory _$$ThemeEventUpdateImplCopyWith(_$ThemeEventUpdateImpl value,
          $Res Function(_$ThemeEventUpdateImpl) then) =
      __$$ThemeEventUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppTheme theme});
}

/// @nodoc
class __$$ThemeEventUpdateImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ThemeEventUpdateImpl>
    implements _$$ThemeEventUpdateImplCopyWith<$Res> {
  __$$ThemeEventUpdateImplCopyWithImpl(_$ThemeEventUpdateImpl _value,
      $Res Function(_$ThemeEventUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$ThemeEventUpdateImpl(
      null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$ThemeEventUpdateImpl implements _ThemeEventUpdate {
  const _$ThemeEventUpdateImpl(this.theme);

  @override
  final AppTheme theme;

  @override
  String toString() {
    return 'ThemeEvent.update(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeEventUpdateImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeEventUpdateImplCopyWith<_$ThemeEventUpdateImpl> get copyWith =>
      __$$ThemeEventUpdateImplCopyWithImpl<_$ThemeEventUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _ThemeEventUpdate implements ThemeEvent {
  const factory _ThemeEventUpdate(final AppTheme theme) =
      _$ThemeEventUpdateImpl;

  @override
  AppTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$ThemeEventUpdateImplCopyWith<_$ThemeEventUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThemeState {
  AppTheme get theme => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeStateIdle value) idle,
    required TResult Function(_ThemeStateInProgress value) inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeStateIdle value)? idle,
    TResult? Function(_ThemeStateInProgress value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeStateIdle value)? idle,
    TResult Function(_ThemeStateInProgress value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({AppTheme theme});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeStateIdleImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateIdleImplCopyWith(_$ThemeStateIdleImpl value,
          $Res Function(_$ThemeStateIdleImpl) then) =
      __$$ThemeStateIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppTheme theme});
}

/// @nodoc
class __$$ThemeStateIdleImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateIdleImpl>
    implements _$$ThemeStateIdleImplCopyWith<$Res> {
  __$$ThemeStateIdleImplCopyWithImpl(
      _$ThemeStateIdleImpl _value, $Res Function(_$ThemeStateIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$ThemeStateIdleImpl(
      null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$ThemeStateIdleImpl implements _ThemeStateIdle {
  const _$ThemeStateIdleImpl(this.theme);

  @override
  final AppTheme theme;

  @override
  String toString() {
    return 'ThemeState.idle(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateIdleImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateIdleImplCopyWith<_$ThemeStateIdleImpl> get copyWith =>
      __$$ThemeStateIdleImplCopyWithImpl<_$ThemeStateIdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeStateIdle value) idle,
    required TResult Function(_ThemeStateInProgress value) inProgress,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeStateIdle value)? idle,
    TResult? Function(_ThemeStateInProgress value)? inProgress,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeStateIdle value)? idle,
    TResult Function(_ThemeStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _ThemeStateIdle implements ThemeState {
  const factory _ThemeStateIdle(final AppTheme theme) = _$ThemeStateIdleImpl;

  @override
  AppTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$ThemeStateIdleImplCopyWith<_$ThemeStateIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeStateInProgressImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateInProgressImplCopyWith(_$ThemeStateInProgressImpl value,
          $Res Function(_$ThemeStateInProgressImpl) then) =
      __$$ThemeStateInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppTheme theme});
}

/// @nodoc
class __$$ThemeStateInProgressImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateInProgressImpl>
    implements _$$ThemeStateInProgressImplCopyWith<$Res> {
  __$$ThemeStateInProgressImplCopyWithImpl(_$ThemeStateInProgressImpl _value,
      $Res Function(_$ThemeStateInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$ThemeStateInProgressImpl(
      null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$ThemeStateInProgressImpl implements _ThemeStateInProgress {
  const _$ThemeStateInProgressImpl(this.theme);

  @override
  final AppTheme theme;

  @override
  String toString() {
    return 'ThemeState.inProgress(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateInProgressImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateInProgressImplCopyWith<_$ThemeStateInProgressImpl>
      get copyWith =>
          __$$ThemeStateInProgressImplCopyWithImpl<_$ThemeStateInProgressImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeStateIdle value) idle,
    required TResult Function(_ThemeStateInProgress value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeStateIdle value)? idle,
    TResult? Function(_ThemeStateInProgress value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeStateIdle value)? idle,
    TResult Function(_ThemeStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _ThemeStateInProgress implements ThemeState {
  const factory _ThemeStateInProgress(final AppTheme theme) =
      _$ThemeStateInProgressImpl;

  @override
  AppTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$ThemeStateInProgressImplCopyWith<_$ThemeStateInProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}
