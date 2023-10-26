import 'dart:async';
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordly/src/core/utils/pattern_match.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/game/model/word_error.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

@immutable
sealed class GameState extends _GameStateBase {
  const GameState();

  const factory GameState.idle({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = _GameStateIdle;

  const factory GameState.win({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = _GameStateWin;

  const factory GameState.loss({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = _GameStateLoss;

  const factory GameState.error({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required WordError error,
    required int? lvlNumber,
  }) = _GameStateError;

  int get currentWordIndex => (board.length - 1) ~/ 5;

  bool get isResultState => maybeMap(win: (_) => true, loss: (_) => true, orElse: false);
}

final class _GameStateIdle extends GameState {
  const _GameStateIdle({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
    required this.lvlNumber,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;
  @override
  final int? lvlNumber;

  @override
  String toString() => 'GameState.idle(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateIdle &&
              dictionary == other.dictionary &&
              secretWord == other.secretWord &&
              gameMode == other.gameMode &&
              gameCompleted == other.gameCompleted &&
              const DeepCollectionEquality().equals(board, other.board) &&
              const DeepCollectionEquality().equals(statuses, other.statuses)) &&
          lvlNumber == other.lvlNumber;

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameMode.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      lvlNumber.hashCode;
}

final class _GameStateWin extends GameState {
  const _GameStateWin({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
    required this.lvlNumber,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;
  @override
  final int? lvlNumber;

  @override
  String toString() => 'GameState.win(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateWin &&
              dictionary == other.dictionary &&
              secretWord == other.secretWord &&
              gameMode == other.gameMode &&
              gameCompleted == other.gameCompleted &&
              const DeepCollectionEquality().equals(board, other.board) &&
              const DeepCollectionEquality().equals(statuses, other.statuses)) &&
          lvlNumber == other.lvlNumber;

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameMode.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      lvlNumber.hashCode;
}

final class _GameStateLoss extends GameState {
  const _GameStateLoss({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
    required this.lvlNumber,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;
  @override
  final int? lvlNumber;

  @override
  String toString() => 'GameState.loss(board: $board)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateLoss &&
              dictionary == other.dictionary &&
              secretWord == other.secretWord &&
              gameMode == other.gameMode &&
              gameCompleted == other.gameCompleted &&
              const DeepCollectionEquality().equals(board, other.board) &&
              const DeepCollectionEquality().equals(statuses, other.statuses)) &&
          lvlNumber == other.lvlNumber;

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameMode.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      lvlNumber.hashCode;
}

final class _GameStateError extends GameState {
  const _GameStateError({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required this.board,
    required this.statuses,
    required this.error,
    required this.lvlNumber,
  });

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  @override
  final List<LetterInfo> board;
  @override
  final Map<String, LetterStatus> statuses;
  @override
  final int? lvlNumber;
  final WordError error;

  @override
  String toString() => 'GameState.error(board: $board, error: $error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GameStateError &&
          dictionary == other.dictionary &&
          secretWord == other.secretWord &&
          gameMode == other.gameMode &&
          gameCompleted == other.gameCompleted &&
          const DeepCollectionEquality().equals(board, other.board) &&
          const DeepCollectionEquality().equals(statuses, other.statuses) &&
          error == other.error &&
          lvlNumber == other.lvlNumber);

  @override
  int get hashCode =>
      dictionary.hashCode ^
      secretWord.hashCode ^
      gameCompleted.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(statuses) ^
      error.hashCode ^
      lvlNumber.hashCode;
}

abstract base class _GameStateBase {
  const _GameStateBase();

  Locale get dictionary;

  String get secretWord;

  GameMode get gameMode;

  bool get gameCompleted;

  List<LetterInfo> get board;

  Map<String, LetterStatus> get statuses;

  int? get lvlNumber;

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
    required T orElse,
    PatternMatch<T, _GameStateIdle>? idle,
    PatternMatch<T, _GameStateWin>? win,
    PatternMatch<T, _GameStateLoss>? loss,
    PatternMatch<T, _GameStateError>? error,
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

  const factory GameEvent.changeGameMode(GameMode gameMode) = _GameEventChangeGameMode;

  const factory GameEvent.resetBoard(GameMode gameMode) = _GameEventResetBoard;

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

final class _GameEventChangeGameMode extends GameEvent {
  const _GameEventChangeGameMode(this.gameMode);

  final GameMode gameMode;

  @override
  String toString() => 'GameEvent.changeGameMode(gameMode: $gameMode)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _GameEventChangeGameMode && gameMode == other.gameMode);

  @override
  int get hashCode => gameMode.hashCode;
}

final class _GameEventResetBoard extends GameEvent {
  const _GameEventResetBoard(this.gameMode);

  final GameMode gameMode;

  @override
  String toString() => 'GameEvent.resetBoard(gameMode: $gameMode)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _GameEventResetBoard && gameMode == other.gameMode);

  @override
  int get hashCode => gameMode.hashCode;
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
    required PatternMatch<T, _GameEventChangeGameMode> changeGameMode,
    required PatternMatch<T, _GameEventResetBoard> resetBoard,
    required PatternMatch<T, _GameEventLetterPressed> letterPressed,
    required PatternMatch<T, _GameEventEnterPressed> enterPressed,
    required PatternMatch<T, _GameEventDeletePressed> deletePressed,
    required PatternMatch<T, _GameEventDeleteLongPressed> deleteLongPressed,
  }) =>
      switch (this) {
        final _GameEventChangeDictionary event => changeDictionary(event),
        final _GameEventChangeGameMode event => changeGameMode(event),
        final _GameEventResetBoard event => resetBoard(event),
        final _GameEventLetterPressed event => letterPressed(event),
        final _GameEventEnterPressed event => enterPressed(event),
        final _GameEventDeletePressed event => deletePressed(event),
        final _GameEventDeleteLongPressed event => deleteLongPressed(event),
        _ => throw AssertionError('Unknown event: $this'),
      };

  T maybeMap<T>({
    required T orElse,
    PatternMatch<T, _GameEventChangeDictionary>? changeDictionary,
    PatternMatch<T, _GameEventChangeGameMode>? changeGameMode,
    PatternMatch<T, _GameEventResetBoard>? resetBoard,
    PatternMatch<T, _GameEventLetterPressed>? letterPressed,
    PatternMatch<T, _GameEventEnterPressed>? enterPressed,
    PatternMatch<T, _GameEventDeletePressed>? deletePressed,
    PatternMatch<T, _GameEventDeleteLongPressed>? deleteLongPressed,
  }) =>
      map(
        changeDictionary: changeDictionary ?? (_) => orElse,
        changeGameMode: changeGameMode ?? (_) => orElse,
        resetBoard: resetBoard ?? (_) => orElse,
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
    required GameResult? savedResult,
  })  : _gameRepository = gameRepository,
        _statisticsRepository = statisticsRepository,
        super(
          _stateBySavedResult(
            savedResult,
            dictionary,
            GameMode.daily,
            gameRepository.generateSecretWord(dictionary),
          ),
        ) {
    on<GameEvent>(
      (event, emit) async => event.map(
        changeDictionary: (e) => _changeDictionary(e, emit),
        changeGameMode: (e) => _changeGameMode(e, emit),
        resetBoard: (e) => _resetBoard(e, emit),
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
    if (state.dictionary == event.dictionary) {
      return;
    }
    final newDictionary = event.dictionary;
    final GameResult? savedResult;
    if (state.gameMode == GameMode.daily) {
      savedResult = _gameRepository.loadDailyFromCache(newDictionary, DateTime.now().toUtc());
    } else {
      savedResult = _gameRepository.loadLvlFromCache(newDictionary);
    }
    final newState = _stateBySavedResult(
      savedResult,
      newDictionary,
      state.gameMode,
      _gameRepository.generateSecretWord(
        newDictionary,
        levelNumber: state.gameMode == GameMode.daily ? 0 : savedResult?.lvlNumber ?? 1,
      ),
    );
    emit(newState);
  }

  void _changeGameMode(
    _GameEventChangeGameMode event,
    Emitter<GameState> emit,
  ) {
    if (state.gameMode == event.gameMode) {
      return;
    }
    final newGameMode = event.gameMode;
    final GameResult? savedResult;
    if (newGameMode == GameMode.daily) {
      savedResult = _gameRepository.loadDailyFromCache(state.dictionary, DateTime.now().toUtc());
    } else {
      savedResult = _gameRepository.loadLvlFromCache(state.dictionary);
    }
    final newState = _stateBySavedResult(
      savedResult,
      state.dictionary,
      newGameMode,
      _gameRepository.generateSecretWord(
        state.dictionary,
        levelNumber: newGameMode == GameMode.daily ? 0 : savedResult?.lvlNumber ?? 1,
      ),
    );
    emit(newState);
  }

  void _resetBoard(
    _GameEventResetBoard event,
    Emitter<GameState> emit,
  ) {
    final GameResult? savedResult;
    if (event.gameMode == GameMode.daily) {
      savedResult = GameResult(
        secretWord: _gameRepository.generateSecretWord(state.dictionary),
        board: [],
      );
    } else {
      savedResult = GameResult(
        secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: (state.lvlNumber ?? 1) + 1),
        lvlNumber: (state.lvlNumber ?? 1) + 1,
        board: [],
      );
      unawaited(_gameRepository.saveLvlBoard(state.dictionary, savedResult));
    }
    final newState = _stateBySavedResult(
      savedResult,
      state.dictionary,
      event.gameMode,
      savedResult.secretWord,
    );
    emit(newState);
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
        gameMode: state.gameMode,
        gameCompleted: state.gameCompleted,
        board: List.of(state.board)..add(LetterInfo(letter: event.key.toString())),
        statuses: state.statuses,
        lvlNumber: state.lvlNumber,
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
        gameMode: state.gameMode,
        gameCompleted: state.gameCompleted,
        board: List.of(state.board)..removeLast(),
        statuses: state.statuses,
        lvlNumber: state.lvlNumber,
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
        gameMode: state.gameMode,
        gameCompleted: state.gameCompleted,
        board: board..removeRange(state.currentWordIndex * 5, board.length),
        statuses: state.statuses,
        lvlNumber: state.lvlNumber,
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
          gameMode: state.gameMode,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
          error: WordError.tooShort,
          lvlNumber: state.lvlNumber,
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
          gameMode: state.gameMode,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
          error: WordError.notFound,
          lvlNumber: state.lvlNumber,
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
          gameMode: state.gameMode,
          gameCompleted: true,
          board: newBoard,
          statuses: newStatuses,
          lvlNumber: state.lvlNumber,
        ),
      );
      switch (state.gameMode) {
        case GameMode.daily:
          unawaited(
            _gameRepository.saveDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(
                secretWord: state.secretWord,
                isWin: true,
                board: state.board,
              ),
            ),
          );
          unawaited(
            _statisticsRepository.saveStatistic(
              state.dictionary,
              isWin: true,
              attempt: state.currentWordIndex + 1,
            ),
          );
        case GameMode.lvl:
          final savedResult = GameResult(
            secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: (state.lvlNumber ?? 1) + 1),
            lvlNumber: (state.lvlNumber ?? 1) + 1,
            board: [],
          );
          unawaited(_gameRepository.saveLvlBoard(state.dictionary, savedResult));
      }

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
          gameMode: state.gameMode,
          gameCompleted: true,
          board: newBoard,
          statuses: newStatuses,
          lvlNumber: state.lvlNumber,
        ),
      );
      switch (state.gameMode) {
        case GameMode.daily:
          unawaited(
            _gameRepository.saveDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(
                secretWord: state.secretWord,
                isWin: false,
                board: state.board,
              ),
            ),
          );
          unawaited(
            _statisticsRepository.saveStatistic(
              state.dictionary,
              isWin: false,
              attempt: state.currentWordIndex + 1,
            ),
          );
        case GameMode.lvl:
          final savedResult = GameResult(
            secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: (state.lvlNumber ?? 1) + 1),
            lvlNumber: (state.lvlNumber ?? 1) + 1,
            board: [],
          );
          unawaited(_gameRepository.saveLvlBoard(state.dictionary, savedResult));
      }
    } else {
      emit(
        GameState.idle(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameMode: state.gameMode,
          gameCompleted: state.gameCompleted,
          board: newBoard,
          statuses: newStatuses,
          lvlNumber: state.lvlNumber,
        ),
      );
      switch (state.gameMode) {
        case GameMode.daily:
          unawaited(
            _gameRepository.saveDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(
                secretWord: state.secretWord,
                board: state.board,
              ),
            ),
          );
        case GameMode.lvl:
          unawaited(
            _gameRepository.saveLvlBoard(
              state.dictionary,
              GameResult(
                secretWord: state.secretWord,
                board: state.board,
                lvlNumber: state.lvlNumber,
              ),
            ),
          );
      }
    }
  }
}

GameState _stateBySavedResult(
  GameResult? savedResult,
  Locale dictionary,
  GameMode gameMode,
  String secretWord,
) {
  if (savedResult == null || savedResult.isWin == null) {
    return GameState.idle(
      dictionary: dictionary,
      secretWord: secretWord,
      gameMode: gameMode,
      gameCompleted: false,
      board: savedResult?.board ?? [],
      statuses: _boardToStatuses(savedResult?.board ?? []),
      lvlNumber: gameMode == GameMode.lvl ? savedResult?.lvlNumber ?? 1 : null,
    );
  }
  if (savedResult.isWin ?? false) {
    return GameState.win(
      dictionary: dictionary,
      secretWord: savedResult.secretWord,
      gameMode: gameMode,
      gameCompleted: true,
      board: savedResult.board,
      statuses: _boardToStatuses(savedResult.board),
      lvlNumber: gameMode == GameMode.lvl ? savedResult.lvlNumber ?? 1 : null,
    );
  }
  return GameState.loss(
    dictionary: dictionary,
    secretWord: savedResult.secretWord,
    gameMode: gameMode,
    gameCompleted: true,
    board: savedResult.board,
    statuses: _boardToStatuses(savedResult.board),
    lvlNumber: gameMode == GameMode.lvl ? savedResult.lvlNumber ?? 1 : null,
  );
}

Map<String, LetterStatus> _boardToStatuses(List<LetterInfo> board) {
  final statuses = <String, LetterStatus>{};
  for (final e in board) {
    statuses[e.letter] = e.status;
  }
  return statuses;
}
