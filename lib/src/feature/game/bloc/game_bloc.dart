import 'dart:async' show unawaited;
import 'dart:ui' show Locale;

import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show KeyEvent, LogicalKeyboardKey;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/feature/game/data/game_repository.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/game/model/keyboard.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/game/model/word_error.dart';
import 'package:wordly/src/feature/level/data/level_repository.dart';
import 'package:wordly/src/feature/statistic/data/statistics_repository.dart';

part 'game_bloc.freezed.dart';

@Freezed(copyWith: false)
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.changeDictionary(Locale dictionary) = _ChangeDictionaryGameEvent;

  const factory GameEvent.changeGameMode(GameMode gameMode) = _ChangeGameModeGameEvent;

  const factory GameEvent.resetBoard(GameMode gameMode) = _ResetBoardGameEvent;

  const factory GameEvent.letterPressed(String key) = _LetterPressedGameEvent;

  const factory GameEvent.deletePressed() = _DeletePressedGameEvent;

  const factory GameEvent.deleteLongPressed() = _DeleteLongPressedGameEvent;

  const factory GameEvent.enterPressed() = _EnterPressedGameEvent;

  const factory GameEvent.listenKeyEvent(KeyEvent keyEvent) = _ListenKeyEventGameEvent;
}

@Freezed()
sealed class GameState with _$GameState {
  const GameState._();

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

  bool get isResultState => maybeMap(win: (_) => true, loss: (_) => true, orElse: () => false);

  bool get isErrorState => maybeMap(error: (_) => true, orElse: () => false);

  (bool, int, List<LetterInfo>)? get buildResultString {
    final result = mapOrNull(win: (_) => true, loss: (_) => false);
    if (result == null) {
      return null;
    }
    return (result, currentWordIndex + 1, board);
  }
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required Locale dictionary,
    required IGameRepository gameRepository,
    required IStatisticsRepository statisticsRepository,
    required ILevelRepository levelRepository,
    required GameResult? savedResult,
  }) : _gameRepository = gameRepository,
       _statisticsRepository = statisticsRepository,
       _levelRepository = levelRepository,
       super(
         _stateBySavedResult(savedResult, dictionary, GameMode.daily, gameRepository.generateSecretWord(dictionary)),
       ) {
    on<GameEvent>(
      (event, emit) async => switch (event) {
        final _ChangeDictionaryGameEvent e => _changeDictionary(e, emit),
        final _ChangeGameModeGameEvent e => _changeGameMode(e, emit),
        final _ResetBoardGameEvent e => _resetBoard(e, emit),
        final _LetterPressedGameEvent e => _letterPressed(e, emit),
        final _EnterPressedGameEvent e => _enterPressed(e, emit),
        final _DeletePressedGameEvent e => _deletePressed(e, emit),
        final _DeleteLongPressedGameEvent e => _deleteLongPressed(e, emit),
        final _ListenKeyEventGameEvent e => _listenKeyEvent(e, emit),
      },
    );
  }

  final IGameRepository _gameRepository;
  final IStatisticsRepository _statisticsRepository;
  final ILevelRepository _levelRepository;

  void _listenKeyEvent(_ListenKeyEventGameEvent event, Emitter<GameState> emit) {
    final key = event.keyEvent;
    if (key.logicalKey == LogicalKeyboardKey.enter) {
      add(const GameEvent.enterPressed());
      return;
    }

    if (key.logicalKey == LogicalKeyboardKey.delete || key.logicalKey == LogicalKeyboardKey.backspace) {
      add(const GameEvent.deletePressed());
      return;
    }

    final letter = GameKeyboardKey.toLetter(key.logicalKey, state.dictionary);
    if (letter != null) {
      add(GameEvent.letterPressed(letter));
      return;
    }
  }

  Future<void> _changeDictionary(_ChangeDictionaryGameEvent event, Emitter<GameState> emit) async {
    final newDictionary = event.dictionary;
    if (state.dictionary.languageCode == newDictionary.languageCode) {
      return;
    }
    final GameResult? savedResult;
    if (state.gameMode == GameMode.daily) {
      savedResult = await _gameRepository.getDaily(newDictionary, DateTime.now().toUtc());
    } else {
      savedResult = await _gameRepository.getLvl(newDictionary);
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

  Future<void> _changeGameMode(_ChangeGameModeGameEvent event, Emitter<GameState> emit) async {
    if (state.gameMode == event.gameMode) {
      return;
    }
    final newGameMode = event.gameMode;
    final GameResult? savedResult;
    if (newGameMode == GameMode.daily) {
      savedResult = await _gameRepository.getDaily(state.dictionary, DateTime.now().toUtc());
    } else {
      savedResult = await _gameRepository.getLvl(state.dictionary);
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

  void _resetBoard(_ResetBoardGameEvent event, Emitter<GameState> emit) {
    final GameResult? savedResult;
    if (event.gameMode == GameMode.daily) {
      savedResult = GameResult(secretWord: _gameRepository.generateSecretWord(state.dictionary), board: []);
    } else {
      savedResult = GameResult(
        secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: (state.lvlNumber ?? 1) + 1),
        lvlNumber: (state.lvlNumber ?? 1) + 1,
        board: [],
      );
      unawaited(_gameRepository.setLvlBoard(state.dictionary, savedResult));
    }
    final newState = _stateBySavedResult(savedResult, state.dictionary, event.gameMode, savedResult.secretWord);
    emit(newState);
  }

  void _letterPressed(_LetterPressedGameEvent event, Emitter<GameState> emit) {
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
        board: List.of(state.board)..add(LetterInfo(letter: event.key.toLowerCase())),
        statuses: state.statuses,
        lvlNumber: state.lvlNumber,
      ),
    );
  }

  void _deletePressed(_DeletePressedGameEvent event, Emitter<GameState> emit) {
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

  void _deleteLongPressed(_DeleteLongPressedGameEvent event, Emitter<GameState> emit) {
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

  void _enterPressed(_EnterPressedGameEvent event, Emitter<GameState> emit) {
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
      emit(
        GameState.idle(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameMode: state.gameMode,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
          lvlNumber: state.lvlNumber,
        ),
      );
      return;
    }
    final word = state.board
        .slice(state.currentWordIndex * 5, state.board.length)
        .map((l) => l.letter)
        .toList(growable: false);
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
      emit(
        GameState.idle(
          dictionary: state.dictionary,
          secretWord: state.secretWord,
          gameMode: state.gameMode,
          gameCompleted: state.gameCompleted,
          board: state.board,
          statuses: state.statuses,
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
            _gameRepository.setDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(secretWord: state.secretWord, isWin: true, board: state.board),
            ),
          );
          unawaited(
            _statisticsRepository.setStatistics(state.dictionary, isWin: true, attempt: state.currentWordIndex + 1),
          );
        case GameMode.lvl:
          unawaited(
            _levelRepository.setLevels(
              state.dictionary,
              GameResult(secretWord: state.secretWord, lvlNumber: state.lvlNumber ?? 1, isWin: true, board: []),
            ),
          );
          unawaited(
            _gameRepository.setLvlBoard(
              state.dictionary,
              GameResult(
                secretWord: _gameRepository.generateSecretWord(
                  state.dictionary,
                  levelNumber: (state.lvlNumber ?? 1) + 1,
                ),
                lvlNumber: (state.lvlNumber ?? 1) + 1,
                board: [],
              ),
            ),
          );
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
        secretWordDictionary[resultWord[i].letter] = secretWordDictionary[resultWord[i].letter]! - 1;
      }
    }
    final newBoard = List.of(state.board)..replaceRange(state.currentWordIndex * 5, state.board.length, resultWord);
    final newStatuses = Map.of(state.statuses);
    for (final e in resultWord) {
      if (!newStatuses.containsKey(e.letter) ||
          newStatuses.containsKey(e.letter) && newStatuses[e.letter]! < e.status) {
        newStatuses[e.letter] = e.status;
      }
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
            _gameRepository.setDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(secretWord: state.secretWord, isWin: false, board: state.board),
            ),
          );
          unawaited(
            _statisticsRepository.setStatistics(state.dictionary, isWin: false, attempt: state.currentWordIndex + 1),
          );
        case GameMode.lvl:
          unawaited(
            _levelRepository.setLevels(
              state.dictionary,
              GameResult(secretWord: state.secretWord, lvlNumber: state.lvlNumber ?? 1, isWin: false, board: []),
            ),
          );
          unawaited(
            _gameRepository.setLvlBoard(
              state.dictionary,
              GameResult(
                secretWord: _gameRepository.generateSecretWord(
                  state.dictionary,
                  levelNumber: (state.lvlNumber ?? 1) + 1,
                ),
                lvlNumber: (state.lvlNumber ?? 1) + 1,
                board: [],
              ),
            ),
          );
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
            _gameRepository.setDailyBoard(
              state.dictionary,
              DateTime.now().toUtc(),
              GameResult(secretWord: state.secretWord, board: state.board),
            ),
          );
        case GameMode.lvl:
          unawaited(
            _gameRepository.setLvlBoard(
              state.dictionary,
              GameResult(secretWord: state.secretWord, board: state.board, lvlNumber: state.lvlNumber),
            ),
          );
      }
    }
  }
}

GameState _stateBySavedResult(GameResult? savedResult, Locale dictionary, GameMode gameMode, String secretWord) {
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
