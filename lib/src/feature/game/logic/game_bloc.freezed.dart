// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) = _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent> implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GameEventChangeDictionaryImplCopyWith<$Res> {
  factory _$$GameEventChangeDictionaryImplCopyWith(
          _$GameEventChangeDictionaryImpl value, $Res Function(_$GameEventChangeDictionaryImpl) then) =
      __$$GameEventChangeDictionaryImplCopyWithImpl<$Res>;

  @useResult
  $Res call({Locale dictionary});
}

/// @nodoc
class __$$GameEventChangeDictionaryImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventChangeDictionaryImpl>
    implements _$$GameEventChangeDictionaryImplCopyWith<$Res> {
  __$$GameEventChangeDictionaryImplCopyWithImpl(
      _$GameEventChangeDictionaryImpl _value, $Res Function(_$GameEventChangeDictionaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
  }) {
    return _then(_$GameEventChangeDictionaryImpl(
      null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$GameEventChangeDictionaryImpl implements _GameEventChangeDictionary {
  const _$GameEventChangeDictionaryImpl(this.dictionary);

  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'GameEvent.changeDictionary(dictionary: $dictionary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventChangeDictionaryImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventChangeDictionaryImplCopyWith<_$GameEventChangeDictionaryImpl> get copyWith =>
      __$$GameEventChangeDictionaryImplCopyWithImpl<_$GameEventChangeDictionaryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return changeDictionary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return changeDictionary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (changeDictionary != null) {
      return changeDictionary(this);
    }
    return orElse();
  }
}

abstract class _GameEventChangeDictionary implements GameEvent {
  const factory _GameEventChangeDictionary(final Locale dictionary) = _$GameEventChangeDictionaryImpl;

  Locale get dictionary;

  @JsonKey(ignore: true)
  _$$GameEventChangeDictionaryImplCopyWith<_$GameEventChangeDictionaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameEventChangeGameModeImplCopyWith<$Res> {
  factory _$$GameEventChangeGameModeImplCopyWith(
          _$GameEventChangeGameModeImpl value, $Res Function(_$GameEventChangeGameModeImpl) then) =
      __$$GameEventChangeGameModeImplCopyWithImpl<$Res>;

  @useResult
  $Res call({GameMode gameMode});
}

/// @nodoc
class __$$GameEventChangeGameModeImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventChangeGameModeImpl>
    implements _$$GameEventChangeGameModeImplCopyWith<$Res> {
  __$$GameEventChangeGameModeImplCopyWithImpl(
      _$GameEventChangeGameModeImpl _value, $Res Function(_$GameEventChangeGameModeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameMode = null,
  }) {
    return _then(_$GameEventChangeGameModeImpl(
      null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
    ));
  }
}

/// @nodoc

class _$GameEventChangeGameModeImpl implements _GameEventChangeGameMode {
  const _$GameEventChangeGameModeImpl(this.gameMode);

  @override
  final GameMode gameMode;

  @override
  String toString() {
    return 'GameEvent.changeGameMode(gameMode: $gameMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventChangeGameModeImpl &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventChangeGameModeImplCopyWith<_$GameEventChangeGameModeImpl> get copyWith =>
      __$$GameEventChangeGameModeImplCopyWithImpl<_$GameEventChangeGameModeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return changeGameMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return changeGameMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (changeGameMode != null) {
      return changeGameMode(this);
    }
    return orElse();
  }
}

abstract class _GameEventChangeGameMode implements GameEvent {
  const factory _GameEventChangeGameMode(final GameMode gameMode) = _$GameEventChangeGameModeImpl;

  GameMode get gameMode;

  @JsonKey(ignore: true)
  _$$GameEventChangeGameModeImplCopyWith<_$GameEventChangeGameModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameEventResetBoardImplCopyWith<$Res> {
  factory _$$GameEventResetBoardImplCopyWith(
          _$GameEventResetBoardImpl value, $Res Function(_$GameEventResetBoardImpl) then) =
      __$$GameEventResetBoardImplCopyWithImpl<$Res>;

  @useResult
  $Res call({GameMode gameMode});
}

/// @nodoc
class __$$GameEventResetBoardImplCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res, _$GameEventResetBoardImpl>
    implements _$$GameEventResetBoardImplCopyWith<$Res> {
  __$$GameEventResetBoardImplCopyWithImpl(
      _$GameEventResetBoardImpl _value, $Res Function(_$GameEventResetBoardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameMode = null,
  }) {
    return _then(_$GameEventResetBoardImpl(
      null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
    ));
  }
}

/// @nodoc

class _$GameEventResetBoardImpl implements _GameEventResetBoard {
  const _$GameEventResetBoardImpl(this.gameMode);

  @override
  final GameMode gameMode;

  @override
  String toString() {
    return 'GameEvent.resetBoard(gameMode: $gameMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventResetBoardImpl &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventResetBoardImplCopyWith<_$GameEventResetBoardImpl> get copyWith =>
      __$$GameEventResetBoardImplCopyWithImpl<_$GameEventResetBoardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return resetBoard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return resetBoard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (resetBoard != null) {
      return resetBoard(this);
    }
    return orElse();
  }
}

abstract class _GameEventResetBoard implements GameEvent {
  const factory _GameEventResetBoard(final GameMode gameMode) = _$GameEventResetBoardImpl;

  GameMode get gameMode;

  @JsonKey(ignore: true)
  _$$GameEventResetBoardImplCopyWith<_$GameEventResetBoardImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameEventLetterPressedImplCopyWith<$Res> {
  factory _$$GameEventLetterPressedImplCopyWith(
          _$GameEventLetterPressedImpl value, $Res Function(_$GameEventLetterPressedImpl) then) =
      __$$GameEventLetterPressedImplCopyWithImpl<$Res>;

  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$GameEventLetterPressedImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventLetterPressedImpl>
    implements _$$GameEventLetterPressedImplCopyWith<$Res> {
  __$$GameEventLetterPressedImplCopyWithImpl(
      _$GameEventLetterPressedImpl _value, $Res Function(_$GameEventLetterPressedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$GameEventLetterPressedImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameEventLetterPressedImpl implements _GameEventLetterPressed {
  const _$GameEventLetterPressedImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'GameEvent.letterPressed(key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventLetterPressedImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventLetterPressedImplCopyWith<_$GameEventLetterPressedImpl> get copyWith =>
      __$$GameEventLetterPressedImplCopyWithImpl<_$GameEventLetterPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return letterPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return letterPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (letterPressed != null) {
      return letterPressed(this);
    }
    return orElse();
  }
}

abstract class _GameEventLetterPressed implements GameEvent {
  const factory _GameEventLetterPressed(final String key) = _$GameEventLetterPressedImpl;

  String get key;

  @JsonKey(ignore: true)
  _$$GameEventLetterPressedImplCopyWith<_$GameEventLetterPressedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameEventDeletePressedImplCopyWith<$Res> {
  factory _$$GameEventDeletePressedImplCopyWith(
          _$GameEventDeletePressedImpl value, $Res Function(_$GameEventDeletePressedImpl) then) =
      __$$GameEventDeletePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameEventDeletePressedImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventDeletePressedImpl>
    implements _$$GameEventDeletePressedImplCopyWith<$Res> {
  __$$GameEventDeletePressedImplCopyWithImpl(
      _$GameEventDeletePressedImpl _value, $Res Function(_$GameEventDeletePressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameEventDeletePressedImpl implements _GameEventDeletePressed {
  const _$GameEventDeletePressedImpl();

  @override
  String toString() {
    return 'GameEvent.deletePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$GameEventDeletePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return deletePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return deletePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (deletePressed != null) {
      return deletePressed(this);
    }
    return orElse();
  }
}

abstract class _GameEventDeletePressed implements GameEvent {
  const factory _GameEventDeletePressed() = _$GameEventDeletePressedImpl;
}

/// @nodoc
abstract class _$$GameEventDeleteLongPressedImplCopyWith<$Res> {
  factory _$$GameEventDeleteLongPressedImplCopyWith(
          _$GameEventDeleteLongPressedImpl value, $Res Function(_$GameEventDeleteLongPressedImpl) then) =
      __$$GameEventDeleteLongPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameEventDeleteLongPressedImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventDeleteLongPressedImpl>
    implements _$$GameEventDeleteLongPressedImplCopyWith<$Res> {
  __$$GameEventDeleteLongPressedImplCopyWithImpl(
      _$GameEventDeleteLongPressedImpl _value, $Res Function(_$GameEventDeleteLongPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameEventDeleteLongPressedImpl implements _GameEventDeleteLongPressed {
  const _$GameEventDeleteLongPressedImpl();

  @override
  String toString() {
    return 'GameEvent.deleteLongPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$GameEventDeleteLongPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return deleteLongPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return deleteLongPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (deleteLongPressed != null) {
      return deleteLongPressed(this);
    }
    return orElse();
  }
}

abstract class _GameEventDeleteLongPressed implements GameEvent {
  const factory _GameEventDeleteLongPressed() = _$GameEventDeleteLongPressedImpl;
}

/// @nodoc
abstract class _$$GameEventEnterPressedImplCopyWith<$Res> {
  factory _$$GameEventEnterPressedImplCopyWith(
          _$GameEventEnterPressedImpl value, $Res Function(_$GameEventEnterPressedImpl) then) =
      __$$GameEventEnterPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameEventEnterPressedImplCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res, _$GameEventEnterPressedImpl>
    implements _$$GameEventEnterPressedImplCopyWith<$Res> {
  __$$GameEventEnterPressedImplCopyWithImpl(
      _$GameEventEnterPressedImpl _value, $Res Function(_$GameEventEnterPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameEventEnterPressedImpl implements _GameEventEnterPressed {
  const _$GameEventEnterPressedImpl();

  @override
  String toString() {
    return 'GameEvent.enterPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$GameEventEnterPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return enterPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return enterPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (enterPressed != null) {
      return enterPressed(this);
    }
    return orElse();
  }
}

abstract class _GameEventEnterPressed implements GameEvent {
  const factory _GameEventEnterPressed() = _$GameEventEnterPressedImpl;
}

/// @nodoc
abstract class _$$GameEventListenKeyEventImplCopyWith<$Res> {
  factory _$$GameEventListenKeyEventImplCopyWith(
          _$GameEventListenKeyEventImpl value, $Res Function(_$GameEventListenKeyEventImpl) then) =
      __$$GameEventListenKeyEventImplCopyWithImpl<$Res>;

  @useResult
  $Res call({KeyEvent keyEvent});
}

/// @nodoc
class __$$GameEventListenKeyEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventListenKeyEventImpl>
    implements _$$GameEventListenKeyEventImplCopyWith<$Res> {
  __$$GameEventListenKeyEventImplCopyWithImpl(
      _$GameEventListenKeyEventImpl _value, $Res Function(_$GameEventListenKeyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyEvent = null,
  }) {
    return _then(_$GameEventListenKeyEventImpl(
      null == keyEvent
          ? _value.keyEvent
          : keyEvent // ignore: cast_nullable_to_non_nullable
              as KeyEvent,
    ));
  }
}

/// @nodoc

class _$GameEventListenKeyEventImpl implements _GameEventListenKeyEvent {
  const _$GameEventListenKeyEventImpl(this.keyEvent);

  @override
  final KeyEvent keyEvent;

  @override
  String toString() {
    return 'GameEvent.listenKeyEvent(keyEvent: $keyEvent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventListenKeyEventImpl &&
            (identical(other.keyEvent, keyEvent) || other.keyEvent == keyEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyEvent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventListenKeyEventImplCopyWith<_$GameEventListenKeyEventImpl> get copyWith =>
      __$$GameEventListenKeyEventImplCopyWithImpl<_$GameEventListenKeyEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEventChangeDictionary value) changeDictionary,
    required TResult Function(_GameEventChangeGameMode value) changeGameMode,
    required TResult Function(_GameEventResetBoard value) resetBoard,
    required TResult Function(_GameEventLetterPressed value) letterPressed,
    required TResult Function(_GameEventDeletePressed value) deletePressed,
    required TResult Function(_GameEventDeleteLongPressed value) deleteLongPressed,
    required TResult Function(_GameEventEnterPressed value) enterPressed,
    required TResult Function(_GameEventListenKeyEvent value) listenKeyEvent,
  }) {
    return listenKeyEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult? Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult? Function(_GameEventResetBoard value)? resetBoard,
    TResult? Function(_GameEventLetterPressed value)? letterPressed,
    TResult? Function(_GameEventDeletePressed value)? deletePressed,
    TResult? Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult? Function(_GameEventEnterPressed value)? enterPressed,
    TResult? Function(_GameEventListenKeyEvent value)? listenKeyEvent,
  }) {
    return listenKeyEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventChangeDictionary value)? changeDictionary,
    TResult Function(_GameEventChangeGameMode value)? changeGameMode,
    TResult Function(_GameEventResetBoard value)? resetBoard,
    TResult Function(_GameEventLetterPressed value)? letterPressed,
    TResult Function(_GameEventDeletePressed value)? deletePressed,
    TResult Function(_GameEventDeleteLongPressed value)? deleteLongPressed,
    TResult Function(_GameEventEnterPressed value)? enterPressed,
    TResult Function(_GameEventListenKeyEvent value)? listenKeyEvent,
    required TResult orElse(),
  }) {
    if (listenKeyEvent != null) {
      return listenKeyEvent(this);
    }
    return orElse();
  }
}

abstract class _GameEventListenKeyEvent implements GameEvent {
  const factory _GameEventListenKeyEvent(final KeyEvent keyEvent) = _$GameEventListenKeyEventImpl;

  KeyEvent get keyEvent;

  @JsonKey(ignore: true)
  _$$GameEventListenKeyEventImplCopyWith<_$GameEventListenKeyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameState {
  Locale get dictionary => throw _privateConstructorUsedError;

  String get secretWord => throw _privateConstructorUsedError;

  GameMode get gameMode => throw _privateConstructorUsedError;

  bool get gameCompleted => throw _privateConstructorUsedError;

  List<LetterInfo> get board => throw _privateConstructorUsedError;

  Map<String, LetterStatus> get statuses => throw _privateConstructorUsedError;

  int? get lvlNumber => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameStateIdle value) idle,
    required TResult Function(_GameStateWin value) win,
    required TResult Function(_GameStateLoss value) loss,
    required TResult Function(_GameStateError value) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,
    TResult Function(_GameStateWin value)? win,
    TResult Function(_GameStateLoss value)? loss,
    TResult Function(_GameStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) = _$GameStateCopyWithImpl<$Res, GameState>;

  @useResult
  $Res call(
      {Locale dictionary,
      String secretWord,
      GameMode gameMode,
      bool gameCompleted,
      List<LetterInfo> board,
      Map<String, LetterStatus> statuses,
      int? lvlNumber});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? secretWord = null,
    Object? gameMode = null,
    Object? gameCompleted = null,
    Object? board = null,
    Object? statuses = null,
    Object? lvlNumber = freezed,
  }) {
    return _then(_value.copyWith(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
      secretWord: null == secretWord
          ? _value.secretWord
          : secretWord // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as List<LetterInfo>,
      statuses: null == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as Map<String, LetterStatus>,
      lvlNumber: freezed == lvlNumber
          ? _value.lvlNumber
          : lvlNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateIdleImplCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$GameStateIdleImplCopyWith(_$GameStateIdleImpl value, $Res Function(_$GameStateIdleImpl) then) =
      __$$GameStateIdleImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {Locale dictionary,
      String secretWord,
      GameMode gameMode,
      bool gameCompleted,
      List<LetterInfo> board,
      Map<String, LetterStatus> statuses,
      int? lvlNumber});
}

/// @nodoc
class __$$GameStateIdleImplCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res, _$GameStateIdleImpl>
    implements _$$GameStateIdleImplCopyWith<$Res> {
  __$$GameStateIdleImplCopyWithImpl(_$GameStateIdleImpl _value, $Res Function(_$GameStateIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? secretWord = null,
    Object? gameMode = null,
    Object? gameCompleted = null,
    Object? board = null,
    Object? statuses = null,
    Object? lvlNumber = freezed,
  }) {
    return _then(_$GameStateIdleImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
      secretWord: null == secretWord
          ? _value.secretWord
          : secretWord // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<LetterInfo>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as Map<String, LetterStatus>,
      lvlNumber: freezed == lvlNumber
          ? _value.lvlNumber
          : lvlNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GameStateIdleImpl extends _GameStateIdle {
  const _$GameStateIdleImpl(
      {required this.dictionary,
      required this.secretWord,
      required this.gameMode,
      required this.gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required this.lvlNumber})
      : _board = board,
        _statuses = statuses,
        super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  String toString() {
    return 'GameState.idle(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateIdleImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary, secretWord, gameMode, gameCompleted,
      const DeepCollectionEquality().hash(_board), const DeepCollectionEquality().hash(_statuses), lvlNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateIdleImplCopyWith<_$GameStateIdleImpl> get copyWith =>
      __$$GameStateIdleImplCopyWithImpl<_$GameStateIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameStateIdle value) idle,
    required TResult Function(_GameStateWin value) win,
    required TResult Function(_GameStateLoss value) loss,
    required TResult Function(_GameStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,
    TResult Function(_GameStateWin value)? win,
    TResult Function(_GameStateLoss value)? loss,
    TResult Function(_GameStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _GameStateIdle extends GameState {
  const factory _GameStateIdle(
      {required final Locale dictionary,
      required final String secretWord,
      required final GameMode gameMode,
      required final bool gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required final int? lvlNumber}) = _$GameStateIdleImpl;

  const _GameStateIdle._() : super._();

  @override
  Locale get dictionary;

  @override
  String get secretWord;

  @override
  GameMode get gameMode;

  @override
  bool get gameCompleted;

  @override
  List<LetterInfo> get board;

  @override
  Map<String, LetterStatus> get statuses;

  @override
  int? get lvlNumber;

  @override
  @JsonKey(ignore: true)
  _$$GameStateIdleImplCopyWith<_$GameStateIdleImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateWinImplCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$GameStateWinImplCopyWith(_$GameStateWinImpl value, $Res Function(_$GameStateWinImpl) then) =
      __$$GameStateWinImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {Locale dictionary,
      String secretWord,
      GameMode gameMode,
      bool gameCompleted,
      List<LetterInfo> board,
      Map<String, LetterStatus> statuses,
      int? lvlNumber});
}

/// @nodoc
class __$$GameStateWinImplCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res, _$GameStateWinImpl>
    implements _$$GameStateWinImplCopyWith<$Res> {
  __$$GameStateWinImplCopyWithImpl(_$GameStateWinImpl _value, $Res Function(_$GameStateWinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? secretWord = null,
    Object? gameMode = null,
    Object? gameCompleted = null,
    Object? board = null,
    Object? statuses = null,
    Object? lvlNumber = freezed,
  }) {
    return _then(_$GameStateWinImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
      secretWord: null == secretWord
          ? _value.secretWord
          : secretWord // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<LetterInfo>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as Map<String, LetterStatus>,
      lvlNumber: freezed == lvlNumber
          ? _value.lvlNumber
          : lvlNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GameStateWinImpl extends _GameStateWin {
  const _$GameStateWinImpl(
      {required this.dictionary,
      required this.secretWord,
      required this.gameMode,
      required this.gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required this.lvlNumber})
      : _board = board,
        _statuses = statuses,
        super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  String toString() {
    return 'GameState.win(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateWinImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary, secretWord, gameMode, gameCompleted,
      const DeepCollectionEquality().hash(_board), const DeepCollectionEquality().hash(_statuses), lvlNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateWinImplCopyWith<_$GameStateWinImpl> get copyWith =>
      __$$GameStateWinImplCopyWithImpl<_$GameStateWinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameStateIdle value) idle,
    required TResult Function(_GameStateWin value) win,
    required TResult Function(_GameStateLoss value) loss,
    required TResult Function(_GameStateError value) error,
  }) {
    return win(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) {
    return win?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,
    TResult Function(_GameStateWin value)? win,
    TResult Function(_GameStateLoss value)? loss,
    TResult Function(_GameStateError value)? error,
    required TResult orElse(),
  }) {
    if (win != null) {
      return win(this);
    }
    return orElse();
  }
}

abstract class _GameStateWin extends GameState {
  const factory _GameStateWin(
      {required final Locale dictionary,
      required final String secretWord,
      required final GameMode gameMode,
      required final bool gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required final int? lvlNumber}) = _$GameStateWinImpl;

  const _GameStateWin._() : super._();

  @override
  Locale get dictionary;

  @override
  String get secretWord;

  @override
  GameMode get gameMode;

  @override
  bool get gameCompleted;

  @override
  List<LetterInfo> get board;

  @override
  Map<String, LetterStatus> get statuses;

  @override
  int? get lvlNumber;

  @override
  @JsonKey(ignore: true)
  _$$GameStateWinImplCopyWith<_$GameStateWinImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateLossImplCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$GameStateLossImplCopyWith(_$GameStateLossImpl value, $Res Function(_$GameStateLossImpl) then) =
      __$$GameStateLossImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {Locale dictionary,
      String secretWord,
      GameMode gameMode,
      bool gameCompleted,
      List<LetterInfo> board,
      Map<String, LetterStatus> statuses,
      int? lvlNumber});
}

/// @nodoc
class __$$GameStateLossImplCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res, _$GameStateLossImpl>
    implements _$$GameStateLossImplCopyWith<$Res> {
  __$$GameStateLossImplCopyWithImpl(_$GameStateLossImpl _value, $Res Function(_$GameStateLossImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? secretWord = null,
    Object? gameMode = null,
    Object? gameCompleted = null,
    Object? board = null,
    Object? statuses = null,
    Object? lvlNumber = freezed,
  }) {
    return _then(_$GameStateLossImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
      secretWord: null == secretWord
          ? _value.secretWord
          : secretWord // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<LetterInfo>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as Map<String, LetterStatus>,
      lvlNumber: freezed == lvlNumber
          ? _value.lvlNumber
          : lvlNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GameStateLossImpl extends _GameStateLoss {
  const _$GameStateLossImpl(
      {required this.dictionary,
      required this.secretWord,
      required this.gameMode,
      required this.gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required this.lvlNumber})
      : _board = board,
        _statuses = statuses,
        super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  String toString() {
    return 'GameState.loss(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateLossImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary, secretWord, gameMode, gameCompleted,
      const DeepCollectionEquality().hash(_board), const DeepCollectionEquality().hash(_statuses), lvlNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateLossImplCopyWith<_$GameStateLossImpl> get copyWith =>
      __$$GameStateLossImplCopyWithImpl<_$GameStateLossImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameStateIdle value) idle,
    required TResult Function(_GameStateWin value) win,
    required TResult Function(_GameStateLoss value) loss,
    required TResult Function(_GameStateError value) error,
  }) {
    return loss(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) {
    return loss?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,
    TResult Function(_GameStateWin value)? win,
    TResult Function(_GameStateLoss value)? loss,
    TResult Function(_GameStateError value)? error,
    required TResult orElse(),
  }) {
    if (loss != null) {
      return loss(this);
    }
    return orElse();
  }
}

abstract class _GameStateLoss extends GameState {
  const factory _GameStateLoss(
      {required final Locale dictionary,
      required final String secretWord,
      required final GameMode gameMode,
      required final bool gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required final int? lvlNumber}) = _$GameStateLossImpl;

  const _GameStateLoss._() : super._();

  @override
  Locale get dictionary;

  @override
  String get secretWord;

  @override
  GameMode get gameMode;

  @override
  bool get gameCompleted;

  @override
  List<LetterInfo> get board;

  @override
  Map<String, LetterStatus> get statuses;

  @override
  int? get lvlNumber;

  @override
  @JsonKey(ignore: true)
  _$$GameStateLossImplCopyWith<_$GameStateLossImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateErrorImplCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$GameStateErrorImplCopyWith(_$GameStateErrorImpl value, $Res Function(_$GameStateErrorImpl) then) =
      __$$GameStateErrorImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {Locale dictionary,
      String secretWord,
      GameMode gameMode,
      bool gameCompleted,
      List<LetterInfo> board,
      Map<String, LetterStatus> statuses,
      WordError error,
      int? lvlNumber});
}

/// @nodoc
class __$$GameStateErrorImplCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res, _$GameStateErrorImpl>
    implements _$$GameStateErrorImplCopyWith<$Res> {
  __$$GameStateErrorImplCopyWithImpl(_$GameStateErrorImpl _value, $Res Function(_$GameStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? secretWord = null,
    Object? gameMode = null,
    Object? gameCompleted = null,
    Object? board = null,
    Object? statuses = null,
    Object? error = null,
    Object? lvlNumber = freezed,
  }) {
    return _then(_$GameStateErrorImpl(
      dictionary: null == dictionary
          ? _value.dictionary
          : dictionary // ignore: cast_nullable_to_non_nullable
              as Locale,
      secretWord: null == secretWord
          ? _value.secretWord
          : secretWord // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<LetterInfo>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as Map<String, LetterStatus>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as WordError,
      lvlNumber: freezed == lvlNumber
          ? _value.lvlNumber
          : lvlNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GameStateErrorImpl extends _GameStateError {
  const _$GameStateErrorImpl(
      {required this.dictionary,
      required this.secretWord,
      required this.gameMode,
      required this.gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required this.error,
      required this.lvlNumber})
      : _board = board,
        _statuses = statuses,
        super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final WordError error;
  @override
  final int? lvlNumber;

  @override
  String toString() {
    return 'GameState.error(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, error: $error, lvlNumber: $lvlNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateErrorImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary, secretWord, gameMode, gameCompleted,
      const DeepCollectionEquality().hash(_board), const DeepCollectionEquality().hash(_statuses), error, lvlNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateErrorImplCopyWith<_$GameStateErrorImpl> get copyWith =>
      __$$GameStateErrorImplCopyWithImpl<_$GameStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameStateIdle value) idle,
    required TResult Function(_GameStateWin value) win,
    required TResult Function(_GameStateLoss value) loss,
    required TResult Function(_GameStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,
    TResult Function(_GameStateWin value)? win,
    TResult Function(_GameStateLoss value)? loss,
    TResult Function(_GameStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GameStateError extends GameState {
  const factory _GameStateError(
      {required final Locale dictionary,
      required final String secretWord,
      required final GameMode gameMode,
      required final bool gameCompleted,
      required final List<LetterInfo> board,
      required final Map<String, LetterStatus> statuses,
      required final WordError error,
      required final int? lvlNumber}) = _$GameStateErrorImpl;

  const _GameStateError._() : super._();

  @override
  Locale get dictionary;

  @override
  String get secretWord;

  @override
  GameMode get gameMode;

  @override
  bool get gameCompleted;

  @override
  List<LetterInfo> get board;

  @override
  Map<String, LetterStatus> get statuses;

  WordError get error;

  @override
  int? get lvlNumber;

  @override
  @JsonKey(ignore: true)
  _$$GameStateErrorImplCopyWith<_$GameStateErrorImpl> get copyWith => throw _privateConstructorUsedError;
}
