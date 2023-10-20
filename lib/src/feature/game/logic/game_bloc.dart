import 'dart:async';
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordly/src/core/utils/pattern_match.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/game/model/saved_result.dart';
import 'package:wordly/src/feature/game/model/word_error.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

@immutable
sealed class GameState extends _GameStateBase {
  const GameState();

  const factory GameState.idle({
    required Locale dictionary,
    required String secretWord,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateIdle;

  const factory GameState.win({
    required Locale dictionary,
    required String secretWord,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateWin;

  const factory GameState.loss({
    required Locale dictionary,
    required String secretWord,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
  }) = _GameStateLoss;

  const factory GameState.error({
    required Locale dictionary,
    required String secretWord,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required WordError error,
  }) = _GameStateError;

  int get currentWordIndex => (board.length - 1) ~/ 5;
}

final class _GameStateIdle extends GameState {
  const _GameStateIdle({
    required this.dictionary,
    required this.secretWord,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final bool gameCompleted;
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
          gameCompleted == other.gameCompleted &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateWin extends GameState {
  const _GameStateWin({
    required this.dictionary,
    required this.secretWord,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final bool gameCompleted;
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
          gameCompleted == other.gameCompleted &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateLoss extends GameState {
  const _GameStateLoss({
    required this.dictionary,
    required this.secretWord,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final bool gameCompleted;
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
          gameCompleted == other.gameCompleted &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses));

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses);
}

final class _GameStateError extends GameState {
  const _GameStateError({
    required this.dictionary,
    required this.secretWord,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
    required this.error,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final bool gameCompleted;
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
          gameCompleted == other.gameCompleted &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses) &&
          error == other.error);

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      error.hashCode;
}

abstract base class _GameStateBase {
  const _GameStateBase();

  Locale get dictionary;

  String get secretWord;

  bool get gameCompleted;

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
    required IStatisticsRepository statisticsRepository,
    required SavedResult? savedResult,
  })  : _gameRepository = gameRepository,
        _statisticsRepository = statisticsRepository,
        super(_stateBySavedResult(savedResult, dictionary, gameRepository.generateSecretWord(dictionary))) {
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
  final IStatisticsRepository _statisticsRepository;

  void _changeDictionary(
    _GameEventChangeDictionary event,
    Emitter<GameState> emit,
  ) {
    final dictionary = event.dictionary;
    final savedResult = _gameRepository.loadDailyFromCache(dictionary, DateTime.now().toUtc());
    emit(_stateBySavedResult(savedResult, dictionary, _gameRepository.generateSecretWord(dictionary)));
  }

  void _letterPressed(
    _GameEventLetterPressed event,
    Emitter<GameState> emit,
  ) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length > 30) {
      return;
    }
    if (state.board.isNotEmpty &&
        state.board.length % 5 == 0 &&
        state.board[state.currentWordIndex * 5].status == LetterStatus.unknown) {
      return;
    }
    emit(
      GameState.idle(
        dictionary: state.dictionary,
        secretWord: state.secretWord,
        gameCompleted: state.gameCompleted,
        board: List.of(state.board)..add(LetterInfo(letter: event.key.toString())),
        statuses: state.statuses,
      ),
    );
  }

  void _deletePressed(
    _GameEventDeletePressed event,
    Emitter<GameState> emit,
  ) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length <= state.currentWordIndex * 5 ||
        state.board[state.currentWordIndex * 5].status != LetterStatus.unknown) {
      return;
    }
    emit(
      GameState.idle(
        dictionary: state.dictionary,
        secretWord: state.secretWord,
        gameCompleted: state.gameCompleted,
        board: List.of(state.board)..removeLast(),
        statuses: state.statuses,
      ),
    );
  }

  void _deleteLongPressed(
    _GameEventDeleteLongPressed event,
    Emitter<GameState> emit,
  ) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length <= state.currentWordIndex * 5 ||
        state.board[state.currentWordIndex * 5].status != LetterStatus.unknown) {
      return;
    }
    final board = List.of(state.board);
    emit(
      GameState.idle(
        dictionary: state.dictionary,
        secretWord: state.secretWord,
        gameCompleted: state.gameCompleted,
        board: board..removeRange(state.currentWordIndex * 5, board.length),
        statuses: state.statuses,
      ),
    );
  }

  void _enterPressed(
    _GameEventEnterPressed event,
    Emitter<GameState> emit,
  ) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.isEmpty || state.board.length % 5 != 0) {
      emit(
        GameState.error(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
          error: WordError.tooShort,
        ),
      );
      return;
    }
    final word =
        state.board.slice(state.currentWordIndex * 5, state.board.length).map((l) => l.letter).toList(growable: false);
    if (!_gameRepository.currentDictionary(state.dictionary).containsKey(word.join())) {
      emit(
        GameState.error(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
          error: WordError.notFound,
        ),
      );
      return;
    }
    if (word.join() == state.secretWord) {
      final correctWord = word.map((e) => LetterInfo(letter: e, status: LetterStatus.correctSpot));

      final newBoard = List.of(state.board)..replaceRange(state.currentWordIndex * 5, state.board.length, correctWord);
      final newStatuses = Map.of(state.statuses);
      for (final e in word) {
        newStatuses[e] = LetterStatus.correctSpot;
      }
      emit(
        GameState.win(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameCompleted: true,
          board: newBoard,
          statuses: newStatuses,
        ),
      );
      unawaited(
        _gameRepository.saveDailyBoard(
          state.dictionary,
          DateTime.now().toUtc(),
          SavedResult(
            secretWord: state.secretWord,
            isWin: true,
            board: state.board,
          ),
        ),
      );
      unawaited(
        _statisticsRepository.setStatistic(
          state.dictionary,
          isWin: true,
          attempt: state.currentWordIndex + 1,
        ),
      );
      return;
    }
    final resultWord = <LetterInfo>[];
    final secretWordDictionary = <String, int>{};
    for (var i = 0; i < word.length; i++) {
      resultWord.add(
        LetterInfo(
          letter: word[i],
          status: state.secretWord[i] == word[i] ? LetterStatus.correctSpot : LetterStatus.notInWord,
        ),
      );
      if (state.secretWord[i] != word[i]) {
        if (secretWordDictionary.containsKey(state.secretWord[i])) {
          secretWordDictionary[state.secretWord[i]] = secretWordDictionary[state.secretWord[i]]! + 1;
        } else {
          secretWordDictionary[state.secretWord[i]] = 1;
        }
      }
    }
    for (var i = 0; i < resultWord.length; i++) {
      if (resultWord[i].status == LetterStatus.correctSpot) {
        continue;
      }
      if (secretWordDictionary.containsKey(resultWord[i].letter) && secretWordDictionary[resultWord[i].letter]! > 0) {
        resultWord[i] = LetterInfo(letter: resultWord[i].letter, status: LetterStatus.wrongSpot);
      }
    }
    final newBoard = List.of(state.board)..replaceRange(state.currentWordIndex * 5, state.board.length, resultWord);
    final newStatuses = Map.of(state.statuses);
    for (final e in resultWord) {
      newStatuses[e.letter] = e.status;
    }
    if (state.currentWordIndex > 4) {
      emit(
        GameState.loss(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameCompleted: true,
          board: newBoard,
          statuses: newStatuses,
        ),
      );
      unawaited(
        _gameRepository.saveDailyBoard(
          state.dictionary,
          DateTime.now().toUtc(),
          SavedResult(
            secretWord: state.secretWord,
            isWin: false,
            board: state.board,
          ),
        ),
      );
      unawaited(
        _statisticsRepository.setStatistic(
          state.dictionary,
          isWin: false,
          attempt: state.currentWordIndex + 1,
        ),
      );
    } else {
      emit(
        GameState.idle(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameCompleted: state.gameCompleted,
          board: newBoard,
          statuses: newStatuses,
        ),
      );
      unawaited(
        _gameRepository.saveDailyBoard(
          state.dictionary,
          DateTime.now().toUtc(),
          SavedResult(
            secretWord: state.secretWord,
            isWin: null,
            board: state.board,
          ),
        ),
      );
    }
  }
}

GameState _stateBySavedResult(SavedResult? savedResult, Locale dictionary, String secretWord) {
  if (savedResult == null || savedResult.isWin == null) {
    return GameState.idle(
      dictionary: dictionary,
      secretWord: secretWord,
      gameCompleted: false,
      board: savedResult?.board ?? [],
      statuses: _boardToStatuses(savedResult?.board ?? []),
    );
  }
  if (savedResult.isWin ?? false) {
    return GameState.win(
      dictionary: dictionary,
      secretWord: savedResult.secretWord,
      gameCompleted: true,
      board: savedResult.board,
      statuses: _boardToStatuses(savedResult.board),
    );
  }
  return GameState.loss(
    dictionary: dictionary,
    secretWord: savedResult.secretWord,
    gameCompleted: true,
    board: savedResult.board,
    statuses: _boardToStatuses(savedResult.board),
  );
}

Map<String, LetterStatus> _boardToStatuses(List<LetterInfo> board) {
  final statuses = <String, LetterStatus>{};
  for (final e in board) {
    statuses[e.letter] = e.status;
  }
  return statuses;
}
