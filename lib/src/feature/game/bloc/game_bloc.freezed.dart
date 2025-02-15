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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc

class _$ChangeDictionaryGameEventImpl implements _ChangeDictionaryGameEvent {
  const _$ChangeDictionaryGameEventImpl(this.dictionary);

  @override
  final Locale dictionary;

  @override
  String toString() {
    return 'GameEvent.changeDictionary(dictionary: $dictionary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDictionaryGameEventImpl &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return changeDictionary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return changeDictionary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (changeDictionary != null) {
      return changeDictionary(this);
    }
    return orElse();
  }
}

abstract class _ChangeDictionaryGameEvent implements GameEvent {
  const factory _ChangeDictionaryGameEvent(final Locale dictionary) = _$ChangeDictionaryGameEventImpl;

  Locale get dictionary;
}

/// @nodoc

class _$ChangeGameModeGameEventImpl implements _ChangeGameModeGameEvent {
  const _$ChangeGameModeGameEventImpl(this.gameMode);

  @override
  final GameMode gameMode;

  @override
  String toString() {
    return 'GameEvent.changeGameMode(gameMode: $gameMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeGameModeGameEventImpl &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return changeGameMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return changeGameMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (changeGameMode != null) {
      return changeGameMode(this);
    }
    return orElse();
  }
}

abstract class _ChangeGameModeGameEvent implements GameEvent {
  const factory _ChangeGameModeGameEvent(final GameMode gameMode) = _$ChangeGameModeGameEventImpl;

  GameMode get gameMode;
}

/// @nodoc

class _$ResetBoardGameEventImpl implements _ResetBoardGameEvent {
  const _$ResetBoardGameEventImpl(this.gameMode);

  @override
  final GameMode gameMode;

  @override
  String toString() {
    return 'GameEvent.resetBoard(gameMode: $gameMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetBoardGameEventImpl &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return resetBoard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return resetBoard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (resetBoard != null) {
      return resetBoard(this);
    }
    return orElse();
  }
}

abstract class _ResetBoardGameEvent implements GameEvent {
  const factory _ResetBoardGameEvent(final GameMode gameMode) = _$ResetBoardGameEventImpl;

  GameMode get gameMode;
}

/// @nodoc

class _$LetterPressedGameEventImpl implements _LetterPressedGameEvent {
  const _$LetterPressedGameEventImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'GameEvent.letterPressed(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterPressedGameEventImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return letterPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return letterPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (letterPressed != null) {
      return letterPressed(this);
    }
    return orElse();
  }
}

abstract class _LetterPressedGameEvent implements GameEvent {
  const factory _LetterPressedGameEvent(final String key) = _$LetterPressedGameEventImpl;

  String get key;
}

/// @nodoc

class _$DeletePressedGameEventImpl implements _DeletePressedGameEvent {
  const _$DeletePressedGameEventImpl();

  @override
  String toString() {
    return 'GameEvent.deletePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$DeletePressedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return deletePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return deletePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (deletePressed != null) {
      return deletePressed(this);
    }
    return orElse();
  }
}

abstract class _DeletePressedGameEvent implements GameEvent {
  const factory _DeletePressedGameEvent() = _$DeletePressedGameEventImpl;
}

/// @nodoc

class _$DeleteLongPressedGameEventImpl implements _DeleteLongPressedGameEvent {
  const _$DeleteLongPressedGameEventImpl();

  @override
  String toString() {
    return 'GameEvent.deleteLongPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$DeleteLongPressedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return deleteLongPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return deleteLongPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (deleteLongPressed != null) {
      return deleteLongPressed(this);
    }
    return orElse();
  }
}

abstract class _DeleteLongPressedGameEvent implements GameEvent {
  const factory _DeleteLongPressedGameEvent() = _$DeleteLongPressedGameEventImpl;
}

/// @nodoc

class _$EnterPressedGameEventImpl implements _EnterPressedGameEvent {
  const _$EnterPressedGameEventImpl();

  @override
  String toString() {
    return 'GameEvent.enterPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$EnterPressedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return enterPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return enterPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (enterPressed != null) {
      return enterPressed(this);
    }
    return orElse();
  }
}

abstract class _EnterPressedGameEvent implements GameEvent {
  const factory _EnterPressedGameEvent() = _$EnterPressedGameEventImpl;
}

/// @nodoc

class _$ListenKeyEventGameEventImpl implements _ListenKeyEventGameEvent {
  const _$ListenKeyEventGameEventImpl(this.keyEvent);

  @override
  final KeyEvent keyEvent;

  @override
  String toString() {
    return 'GameEvent.listenKeyEvent(keyEvent: $keyEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenKeyEventGameEventImpl &&
            (identical(other.keyEvent, keyEvent) || other.keyEvent == keyEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyEvent);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDictionaryGameEvent value) changeDictionary,
    required TResult Function(_ChangeGameModeGameEvent value) changeGameMode,
    required TResult Function(_ResetBoardGameEvent value) resetBoard,
    required TResult Function(_LetterPressedGameEvent value) letterPressed,
    required TResult Function(_DeletePressedGameEvent value) deletePressed,
    required TResult Function(_DeleteLongPressedGameEvent value) deleteLongPressed,
    required TResult Function(_EnterPressedGameEvent value) enterPressed,
    required TResult Function(_ListenKeyEventGameEvent value) listenKeyEvent,
  }) {
    return listenKeyEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDictionaryGameEvent value)? changeDictionary,
    TResult? Function(_ChangeGameModeGameEvent value)? changeGameMode,
    TResult? Function(_ResetBoardGameEvent value)? resetBoard,
    TResult? Function(_LetterPressedGameEvent value)? letterPressed,
    TResult? Function(_DeletePressedGameEvent value)? deletePressed,
    TResult? Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,
    TResult? Function(_EnterPressedGameEvent value)? enterPressed,
    TResult? Function(_ListenKeyEventGameEvent value)? listenKeyEvent,
  }) {
    return listenKeyEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDictionaryGameEvent value)? changeDictionary,

    TResult Function(_ChangeGameModeGameEvent value)? changeGameMode,

    TResult Function(_ResetBoardGameEvent value)? resetBoard,

    TResult Function(_LetterPressedGameEvent value)? letterPressed,

    TResult Function(_DeletePressedGameEvent value)? deletePressed,

    TResult Function(_DeleteLongPressedGameEvent value)? deleteLongPressed,

    TResult Function(_EnterPressedGameEvent value)? enterPressed,

    TResult Function(_ListenKeyEventGameEvent value)? listenKeyEvent,

    required TResult orElse(),
  }) {
    if (listenKeyEvent != null) {
      return listenKeyEvent(this);
    }
    return orElse();
  }
}

abstract class _ListenKeyEventGameEvent implements GameEvent {
  const factory _ListenKeyEventGameEvent(final KeyEvent keyEvent) = _$ListenKeyEventGameEventImpl;

  KeyEvent get keyEvent;
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
  }) => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameStateIdle value)? idle,
    TResult? Function(_GameStateWin value)? win,
    TResult? Function(_GameStateLoss value)? loss,
    TResult? Function(_GameStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameStateIdle value)? idle,

    TResult Function(_GameStateWin value)? win,

    TResult Function(_GameStateLoss value)? loss,

    TResult Function(_GameStateError value)? error,

    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc

class _$GameStateIdleImpl extends _GameStateIdle {
  const _$GameStateIdleImpl({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
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
  bool operator ==(Object other) {
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
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

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
  const factory _GameStateIdle({
    required final Locale dictionary,
    required final String secretWord,
    required final GameMode gameMode,
    required final bool gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required final int? lvlNumber,
  }) = _$GameStateIdleImpl;

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
}

/// @nodoc

class _$GameStateWinImpl extends _GameStateWin {
  const _$GameStateWinImpl({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
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
  bool operator ==(Object other) {
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
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

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
  const factory _GameStateWin({
    required final Locale dictionary,
    required final String secretWord,
    required final GameMode gameMode,
    required final bool gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required final int? lvlNumber,
  }) = _$GameStateWinImpl;

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
}

/// @nodoc

class _$GameStateLossImpl extends _GameStateLoss {
  const _$GameStateLossImpl({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
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
  bool operator ==(Object other) {
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
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

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
  const factory _GameStateLoss({
    required final Locale dictionary,
    required final String secretWord,
    required final GameMode gameMode,
    required final bool gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required final int? lvlNumber,
  }) = _$GameStateLossImpl;

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
}

/// @nodoc

class _$GameStateErrorImpl extends _GameStateError {
  const _$GameStateErrorImpl({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.error,
    required this.lvlNumber,
  }) : _board = board,
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
  bool operator ==(Object other) {
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
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    error,
    lvlNumber,
  );

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
  const factory _GameStateError({
    required final Locale dictionary,
    required final String secretWord,
    required final GameMode gameMode,
    required final bool gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required final WordError error,
    required final int? lvlNumber,
  }) = _$GameStateErrorImpl;

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
}
