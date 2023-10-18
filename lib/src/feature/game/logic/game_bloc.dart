import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordly/src/core/utils/pattern_match.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/game/model/word_error.dart';

@immutable
sealed class GameState extends _GameStateBase {
  const GameState();

  const factory GameState.idle({
    required Locale dictionary,
    required String secretWord,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateIdle;

  const factory GameState.win({
    required Locale dictionary,
    required String secretWord,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateWin;

  const factory GameState.loss({
    required Locale dictionary,
    required String secretWord,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateLoss;

  const factory GameState.error({
    required Locale dictionary,
    required String secretWord,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required WordError error,
  }) = _GameStateError;
}

final class _GameStateIdle extends GameState {
  const _GameStateIdle({
    required this.dictionary,
    required this.secretWord,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;

  @override
  String toString() => 'GameState.idle(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateIdle &&
          dictionary == other.dictionary &&
          secretWord == other.secretWord &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateWin extends GameState {
  const _GameStateWin({
    required this.dictionary,
    required this.secretWord,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;

  @override
  String toString() => 'GameState.win(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateWin &&
          dictionary == other.dictionary &&
          secretWord == other.secretWord &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateLoss extends GameState {
  const _GameStateLoss({
    required this.dictionary,
    required this.secretWord,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;

  @override
  String toString() => 'GameState.loss(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateLoss &&
          dictionary == other.dictionary &&
          secretWord == other.secretWord &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateError extends GameState {
  const _GameStateError({
    required this.dictionary,
    required this.secretWord,
    required this.board,
    required this.statuses,
    required this.error,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;
  final WordError error;

  @override
  String toString() => 'GameState.error(board: $board, error: $error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateError &&
          dictionary == other.dictionary &&
          secretWord == other.secretWord &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses) &&
          error == other.error);

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      error.hashCode;
}

abstract base class _GameStateBase {
  const _GameStateBase();

  Locale get dictionary;

  String get secretWord;

  List<LetterInfo> get board;

  Map<String, LetterStatus> get statuses;

  T map<T>({
    required PatternMatch<T, _GameStateIdle> idle,
    required PatternMatch<T, _GameStateWin> win,
    required PatternMatch<T, _GameStateLoss> loss,
    required PatternMatch<T, _GameStateError> error,
  }) =>
      switch (this) {
        final _GameStateIdle state => idle(state),
        final _GameStateWin state => win(state),
        final _GameStateLoss state => loss(state),
        final _GameStateError state => error(state),
        _ => throw AssertionError('Unknown state: $this'),
      };

  T maybeMap<T>({
    required PatternMatch<T, _GameStateIdle>? idle,
    required PatternMatch<T, _GameStateWin>? win,
    required PatternMatch<T, _GameStateLoss>? loss,
    required PatternMatch<T, _GameStateError>? error,
    required T orElse,
  }) =>
      map(
        idle: idle ?? (_) => orElse,
        win: win ?? (_) => orElse,
        loss: loss ?? (_) => orElse,
        error: error ?? (_) => orElse,
      );
}

@immutable
sealed class GameEvent extends _GameEventBase {
  const GameEvent();

  const factory GameEvent.changeDictionary(Locale dictionary) = _GameEventChangeDictionary;

  const factory GameEvent.letterPressed(Object key) = _GameEventLetterPressed;

  const factory GameEvent.deletePressed() = _GameEventDeletePressed;

  const factory GameEvent.deleteLongPressed() = _GameEventDeleteLongPressed;

  const factory GameEvent.enterPressed() = _GameEventEnterPressed;
}

final class _GameEventChangeDictionary extends GameEvent {
  const _GameEventChangeDictionary(this.dictionary);

  final Locale dictionary;

  @override
  String toString() => 'GameEvent.changeDictionary(dictionary: $dictionary)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _GameEventChangeDictionary && dictionary == other.dictionary);

  @override
  int get hashCode => dictionary.hashCode;
}

final class _GameEventLetterPressed extends GameEvent {
  const _GameEventLetterPressed(this.key);

  final Object key;

  @override
  String toString() => 'GameEvent.letterPressed(key: $key)';

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _GameEventLetterPressed && key == other.key);

  @override
  int get hashCode => key.hashCode;
}

final class _GameEventEnterPressed extends GameEvent {
  const _GameEventEnterPressed();

  @override
  String toString() => 'GameEvent.enterPressed()';

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _GameEventEnterPressed);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class _GameEventDeletePressed extends GameEvent {
  const _GameEventDeletePressed();

  @override
  String toString() => 'GameEvent.deletePressed()';

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _GameEventDeletePressed);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class _GameEventDeleteLongPressed extends GameEvent {
  const _GameEventDeleteLongPressed();

  @override
  String toString() => 'GameEvent.deleteLongPressed()';

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _GameEventDeleteLongPressed);

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract base class _GameEventBase {
  const _GameEventBase();

  T map<T>({
    required PatternMatch<T, _GameEventChangeDictionary> changeDictionary,
    required PatternMatch<T, _GameEventLetterPressed> letterPressed,
    required PatternMatch<T, _GameEventEnterPressed> enterPressed,
    required PatternMatch<T, _GameEventDeletePressed> deletePressed,
    required PatternMatch<T, _GameEventDeleteLongPressed> deleteLongPressed,
  }) =>
      switch (this) {
        final _GameEventChangeDictionary event => changeDictionary(event),
        final _GameEventLetterPressed event => letterPressed(event),
        final _GameEventEnterPressed event => enterPressed(event),
        final _GameEventDeletePressed event => deletePressed(event),
        final _GameEventDeleteLongPressed event => deleteLongPressed(event),
        _ => throw AssertionError('Unknown event: $this'),
      };

  T maybeMap<T>({
    required PatternMatch<T, _GameEventChangeDictionary>? changeDictionary,
    required PatternMatch<T, _GameEventLetterPressed>? letterPressed,
    required PatternMatch<T, _GameEventEnterPressed>? enterPressed,
    required PatternMatch<T, _GameEventDeletePressed>? deletePressed,
    required PatternMatch<T, _GameEventDeleteLongPressed>? deleteLongPressed,
    required T orElse,
  }) =>
      map(
        changeDictionary: changeDictionary ?? (_) => orElse,
        letterPressed: letterPressed ?? (_) => orElse,
        enterPressed: enterPressed ?? (_) => orElse,
        deletePressed: deletePressed ?? (_) => orElse,
        deleteLongPressed: deleteLongPressed ?? (_) => orElse,
      );
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required Locale dictionary,
    required IGameRepository gameRepository,
  })  : _gameRepository = gameRepository,
        super(
          GameState.idle(dictionary: dictionary, board: const [], secretWord: '', statuses: const {}),
        ) {
    on<GameEvent>(
      (event, emit) async => event.map(
        changeDictionary: (e) => _changeDictionary(e, emit),
        letterPressed: (e) => _letterPressed(e, emit),
        enterPressed: (e) => _enterPressed(e, emit),
        deletePressed: (e) => _deletePressed(e, emit),
        deleteLongPressed: (e) => _deleteLongPressed(e, emit),
      ),
    );
  }

  final IGameRepository _gameRepository;

  void _changeDictionary(
    _GameEventChangeDictionary event,
    Emitter<GameState> emit,
  ) {}

  void _letterPressed(
    _GameEventLetterPressed event,
    Emitter<GameState> emit,
  ) {}

  void _deletePressed(
    _GameEventDeletePressed event,
    Emitter<GameState> emit,
  ) {}

  void _deleteLongPressed(
    _GameEventDeleteLongPressed event,
    Emitter<GameState> emit,
  ) {}

  void _enterPressed(
    _GameEventEnterPressed event,
    Emitter<GameState> emit,
  ) {}
}
