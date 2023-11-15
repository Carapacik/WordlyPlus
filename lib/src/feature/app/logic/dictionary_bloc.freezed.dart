// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DictionaryEvent {
  Locale get dictionary => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DictionaryEventCopyWith<DictionaryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryEventCopyWith<$Res> {
  factory $DictionaryEventCopyWith(
          DictionaryEvent value, $Res Function(DictionaryEvent) then) =
      _$DictionaryEventCopyWithImpl<$Res, DictionaryEvent>;
  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class _$DictionaryEventCopyWithImpl<$Res, $Val extends DictionaryEvent>
    implements $DictionaryEventCopyWith<$Res> {
  _$DictionaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_value.copyWith(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DictionaryEventUpdateImplCopyWith<$Res>
    implements $DictionaryEventCopyWith<$Res> {
  factory _$$DictionaryEventUpdateImplCopyWith(
          _$DictionaryEventUpdateImpl value,
          $Res Function(_$DictionaryEventUpdateImpl) then) =
      __$$DictionaryEventUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class __$$DictionaryEventUpdateImplCopyWithImpl<$Res>
    extends _$DictionaryEventCopyWithImpl<$Res, _$DictionaryEventUpdateImpl>
    implements _$$DictionaryEventUpdateImplCopyWith<$Res> {
  __$$DictionaryEventUpdateImplCopyWithImpl(_$DictionaryEventUpdateImpl _value,
      $Res Function(_$DictionaryEventUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_$DictionaryEventUpdateImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$DictionaryEventUpdateImpl implements _DictionaryEventUpdate {
  const _$DictionaryEventUpdateImpl({required this.dictionary});

  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'DictionaryEvent.update(dictionary: $dictionary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryEventUpdateImpl &&
            (identical(other.dictionary, dictionary) ||
                other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryEventUpdateImplCopyWith<_$DictionaryEventUpdateImpl>
      get copyWith => __$$DictionaryEventUpdateImplCopyWithImpl<
          _$DictionaryEventUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _DictionaryEventUpdate implements DictionaryEvent {
  const factory _DictionaryEventUpdate({required final Locale dictionary}) =
      _$DictionaryEventUpdateImpl;

  @override
  Locale get dictionary;
  @override
  @JsonKey(ignore: true)
  _$$DictionaryEventUpdateImplCopyWith<_$DictionaryEventUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DictionaryState {
  Locale get dictionary => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryStateIdle value) idle,
    required TResult Function(_DictionaryStateInProgress value) inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryStateIdle value)? idle,
    TResult? Function(_DictionaryStateInProgress value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryStateIdle value)? idle,
    TResult Function(_DictionaryStateInProgress value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DictionaryStateCopyWith<DictionaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryStateCopyWith<$Res> {
  factory $DictionaryStateCopyWith(
          DictionaryState value, $Res Function(DictionaryState) then) =
      _$DictionaryStateCopyWithImpl<$Res, DictionaryState>;
  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class _$DictionaryStateCopyWithImpl<$Res, $Val extends DictionaryState>
    implements $DictionaryStateCopyWith<$Res> {
  _$DictionaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_value.copyWith(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DictionaryStateIdleImplCopyWith<$Res>
    implements $DictionaryStateCopyWith<$Res> {
  factory _$$DictionaryStateIdleImplCopyWith(_$DictionaryStateIdleImpl value,
          $Res Function(_$DictionaryStateIdleImpl) then) =
      __$$DictionaryStateIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class __$$DictionaryStateIdleImplCopyWithImpl<$Res>
    extends _$DictionaryStateCopyWithImpl<$Res, _$DictionaryStateIdleImpl>
    implements _$$DictionaryStateIdleImplCopyWith<$Res> {
  __$$DictionaryStateIdleImplCopyWithImpl(_$DictionaryStateIdleImpl _value,
      $Res Function(_$DictionaryStateIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_$DictionaryStateIdleImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$DictionaryStateIdleImpl implements _DictionaryStateIdle {
  const _$DictionaryStateIdleImpl({required this.dictionary});

  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'DictionaryState.idle(dictionary: $dictionary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryStateIdleImpl &&
            (identical(other.dictionary, dictionary) ||
                other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryStateIdleImplCopyWith<_$DictionaryStateIdleImpl> get copyWith =>
      __$$DictionaryStateIdleImplCopyWithImpl<_$DictionaryStateIdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryStateIdle value) idle,
    required TResult Function(_DictionaryStateInProgress value) inProgress,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryStateIdle value)? idle,
    TResult? Function(_DictionaryStateInProgress value)? inProgress,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryStateIdle value)? idle,
    TResult Function(_DictionaryStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _DictionaryStateIdle implements DictionaryState {
  const factory _DictionaryStateIdle({required final Locale dictionary}) =
      _$DictionaryStateIdleImpl;

  @override
  Locale get dictionary;
  @override
  @JsonKey(ignore: true)
  _$$DictionaryStateIdleImplCopyWith<_$DictionaryStateIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DictionaryStateInProgressImplCopyWith<$Res>
    implements $DictionaryStateCopyWith<$Res> {
  factory _$$DictionaryStateInProgressImplCopyWith(
          _$DictionaryStateInProgressImpl value,
          $Res Function(_$DictionaryStateInProgressImpl) then) =
      __$$DictionaryStateInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class __$$DictionaryStateInProgressImplCopyWithImpl<$Res>
    extends _$DictionaryStateCopyWithImpl<$Res, _$DictionaryStateInProgressImpl>
    implements _$$DictionaryStateInProgressImplCopyWith<$Res> {
  __$$DictionaryStateInProgressImplCopyWithImpl(
      _$DictionaryStateInProgressImpl _value,
      $Res Function(_$DictionaryStateInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_$DictionaryStateInProgressImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$DictionaryStateInProgressImpl implements _DictionaryStateInProgress {
  const _$DictionaryStateInProgressImpl({required this.dictionary});

  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'DictionaryState.inProgress(dictionary: $dictionary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryStateInProgressImpl &&
            (identical(other.dictionary, dictionary) ||
                other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryStateInProgressImplCopyWith<_$DictionaryStateInProgressImpl>
      get copyWith => __$$DictionaryStateInProgressImplCopyWithImpl<
          _$DictionaryStateInProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryStateIdle value) idle,
    required TResult Function(_DictionaryStateInProgress value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryStateIdle value)? idle,
    TResult? Function(_DictionaryStateInProgress value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryStateIdle value)? idle,
    TResult Function(_DictionaryStateInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _DictionaryStateInProgress implements DictionaryState {
  const factory _DictionaryStateInProgress({required final Locale dictionary}) =
      _$DictionaryStateInProgressImpl;

  @override
  Locale get dictionary;
  @override
  @JsonKey(ignore: true)
  _$$DictionaryStateInProgressImplCopyWith<_$DictionaryStateInProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}
