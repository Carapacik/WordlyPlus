import 'dart:async' show unawaited;
import 'dart:ui' show Locale;

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show KeyEvent, LogicalKeyboardKey;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/feature/game/domain/model/game_mode.dart';
import 'package:wordly/src/feature/game/domain/model/game_result.dart';
import 'package:wordly/src/feature/game/domain/model/keyboard.dart';
import 'package:wordly/src/feature/game/domain/model/letter_info.dart';
import 'package:wordly/src/feature/game/domain/model/word_error.dart';
import 'package:wordly/src/feature/game/domain/repositories/game_repository.dart';
import 'package:wordly/src/feature/level/domain/repositories/level_repository.dart';
import 'package:wordly/src/feature/level/level.dart';
import 'package:wordly/src/feature/statistic/domain/repositories/statistics_repository.dart';
import 'package:wordly/src/feature/statistic/statistic.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

final class GameBloc extends Bloc<GameEvent, GameState> {
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
        final _GameChangeDictionary e => _changeDictionary(e, emit),
        final _GameChangeGameMode e => _changeGameMode(e, emit),
        final _GameResetBoard e => _resetBoard(e, emit),
        final _GameLetterPressed e => _letterPressed(e, emit),
        final _GameEnterPressed e => _enterPressed(e, emit),
        final _GameDeletePressed e => _deletePressed(e, emit),
        final _GameDeleteLongPressed e => _deleteLongPressed(e, emit),
        final _GameListenKeyEvent e => _listenKeyEvent(e, emit),
      },
    );
  }

  static const int _wordLength = 5;
  static const int _maxWords = 6;
  static const int _maxLetters = _wordLength * _maxWords;

  final IGameRepository _gameRepository;
  final IStatisticsRepository _statisticsRepository;
  final ILevelRepository _levelRepository;

  Future<GameResult?> _loadSavedResult(GameMode mode, Locale dictionary) {
    if (mode == GameMode.daily) {
      return _gameRepository.getDaily(dictionary, DateTime.now().toUtc());
    }
    return _gameRepository.getLvl(dictionary);
  }

  GameState _buildIdleState({
    List<LetterInfo>? board,
    Map<String, LetterStatus>? statuses,
    bool? gameCompleted,
    String? secretWord,
    GameMode? gameMode,
    Locale? dictionary,
    int? lvlNumber,
  }) {
    return GameState.idle(
      dictionary: dictionary ?? state.dictionary,
      secretWord: secretWord ?? state.secretWord,
      gameMode: gameMode ?? state.gameMode,
      gameCompleted: gameCompleted ?? state.gameCompleted,
      board: board ?? state.board,
      statuses: statuses ?? state.statuses,
      lvlNumber: lvlNumber ?? state.lvlNumber,
    );
  }

  GameState _buildFailureState({required WordError error}) {
    return GameState.failure(
      dictionary: state.dictionary,
      secretWord: state.secretWord,
      gameMode: state.gameMode,
      gameCompleted: state.gameCompleted,
      board: state.board,
      statuses: state.statuses,
      error: error,
      lvlNumber: state.lvlNumber,
    );
  }

  GameState _buildWinState({required List<LetterInfo> board, required Map<String, LetterStatus> statuses}) {
    return GameState.win(
      dictionary: state.dictionary,
      secretWord: state.secretWord,
      gameMode: state.gameMode,
      gameCompleted: true,
      board: board,
      statuses: statuses,
      lvlNumber: state.lvlNumber,
    );
  }

  GameState _buildLossState({required List<LetterInfo> board, required Map<String, LetterStatus> statuses}) {
    return GameState.loss(
      dictionary: state.dictionary,
      secretWord: state.secretWord,
      gameMode: state.gameMode,
      gameCompleted: true,
      board: board,
      statuses: statuses,
      lvlNumber: state.lvlNumber,
    );
  }

  void _saveDailyResult({required List<LetterInfo> board, bool? isWin}) {
    unawaited(
      _gameRepository.setDailyBoard(
        state.dictionary,
        DateTime.now().toUtc(),
        GameResult(secretWord: state.secretWord, isWin: isWin, board: board),
      ),
    );
    if (isWin == null) {
      return;
    }
    unawaited(
      _statisticsRepository.saveStatistic(
        state.dictionary.languageCode,
        isWin: isWin,
        attempt: state.currentWordIndex + 1,
      ),
    );
  }

  void _saveLevelProgress({required List<LetterInfo> board}) {
    unawaited(
      _gameRepository.setLvlBoard(
        state.dictionary,
        GameResult(secretWord: state.secretWord, board: board, lvlNumber: state.lvlNumber),
      ),
    );
  }

  void _completeLevel({required bool isWin}) {
    final int currentLevel = state.lvlNumber ?? 1;
    final int nextLevel = currentLevel + 1;
    unawaited(
      _levelRepository.setLevels(
        state.dictionary,
        GameResult(secretWord: state.secretWord, lvlNumber: currentLevel, isWin: isWin, board: []),
      ),
    );
    unawaited(
      _gameRepository.setLvlBoard(
        state.dictionary,
        GameResult(
          secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: nextLevel),
          lvlNumber: nextLevel,
          board: [],
        ),
      ),
    );
  }

  void _emitFailureThenIdle(Emitter<GameState> emit, WordError error) {
    emit(_buildFailureState(error: error));
    emit(_buildIdleState());
  }

  void _listenKeyEvent(_GameListenKeyEvent event, Emitter<GameState> emit) {
    final KeyEvent key = event.keyEvent;
    if (key.logicalKey == LogicalKeyboardKey.enter) {
      add(const GameEvent.enterPressed());
      return;
    }

    if (key.logicalKey == LogicalKeyboardKey.delete || key.logicalKey == LogicalKeyboardKey.backspace) {
      add(const GameEvent.deletePressed());
      return;
    }

    final String? letter = GameKeyboardKey.toLetter(key.logicalKey, state.dictionary);
    if (letter != null) {
      add(GameEvent.letterPressed(letter));
      return;
    }
  }

  Future<void> _changeDictionary(_GameChangeDictionary event, Emitter<GameState> emit) async {
    final Locale newDictionary = event.dictionary;
    if (state.dictionary.languageCode == newDictionary.languageCode) {
      return;
    }
    final GameResult? savedResult = await _loadSavedResult(state.gameMode, newDictionary);
    final GameState newState = _stateBySavedResult(
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

  Future<void> _changeGameMode(_GameChangeGameMode event, Emitter<GameState> emit) async {
    if (state.gameMode == event.gameMode) {
      return;
    }
    final GameMode newGameMode = event.gameMode;
    final GameResult? savedResult = await _loadSavedResult(newGameMode, state.dictionary);
    final GameState newState = _stateBySavedResult(
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

  void _resetBoard(_GameResetBoard event, Emitter<GameState> emit) {
    final GameResult? savedResult;
    if (event.gameMode == GameMode.daily) {
      savedResult = GameResult(secretWord: _gameRepository.generateSecretWord(state.dictionary), board: []);
    } else {
      final int nextLevel = (state.lvlNumber ?? 1) + 1;
      savedResult = GameResult(
        secretWord: _gameRepository.generateSecretWord(state.dictionary, levelNumber: nextLevel),
        lvlNumber: nextLevel,
        board: [],
      );
      unawaited(_gameRepository.setLvlBoard(state.dictionary, savedResult));
    }
    final GameState newState = _stateBySavedResult(
      savedResult,
      state.dictionary,
      event.gameMode,
      savedResult.secretWord,
    );
    emit(newState);
  }

  void _letterPressed(_GameLetterPressed event, Emitter<GameState> emit) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length >= _maxLetters) {
      return;
    }
    if (state.board.isNotEmpty &&
        state.board.length % _wordLength == 0 &&
        state.board[state.currentWordIndex * _wordLength].status == LetterStatus.unknown) {
      return;
    }
    emit(_buildIdleState(board: List.of(state.board)..add(LetterInfo(letter: event.key.toLowerCase()))));
  }

  void _deletePressed(_GameDeletePressed event, Emitter<GameState> emit) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length <= state.currentWordIndex * _wordLength ||
        state.board[state.currentWordIndex * _wordLength].status != LetterStatus.unknown) {
      return;
    }
    emit(_buildIdleState(board: List.of(state.board)..removeLast()));
  }

  void _deleteLongPressed(_GameDeleteLongPressed event, Emitter<GameState> emit) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.length <= state.currentWordIndex * _wordLength ||
        state.board[state.currentWordIndex * _wordLength].status != LetterStatus.unknown) {
      return;
    }
    final List<LetterInfo> board = List.of(state.board);
    emit(_buildIdleState(board: board..removeRange(state.currentWordIndex * _wordLength, board.length)));
  }

  void _enterPressed(_GameEnterPressed event, Emitter<GameState> emit) {
    if (state.gameCompleted) {
      return;
    }
    if (state.board.isEmpty || state.board.length % _wordLength != 0) {
      _emitFailureThenIdle(emit, WordError.tooShort);
      return;
    }
    final List<String> word = state.board
        .slice(state.currentWordIndex * _wordLength, state.board.length)
        .map((l) => l.letter)
        .toList(growable: false);
    final String currentWord = word.join();
    if (!_gameRepository.currentDictionary(state.dictionary).containsKey(currentWord)) {
      _emitFailureThenIdle(emit, WordError.notFound);
      return;
    }
    if (currentWord == state.secretWord) {
      final Iterable<LetterInfo> correctWord = word.map((e) => LetterInfo(letter: e, status: LetterStatus.correctSpot));
      final List<LetterInfo> newBoard = List.of(state.board)
        ..replaceRange(state.currentWordIndex * _wordLength, state.board.length, correctWord);
      final Map<String, LetterStatus> newStatuses = Map.of(state.statuses);
      for (final e in word) {
        newStatuses[e] = LetterStatus.correctSpot;
      }
      emit(_buildWinState(board: newBoard, statuses: newStatuses));
      switch (state.gameMode) {
        case GameMode.daily:
          _saveDailyResult(board: newBoard, isWin: true);
        case GameMode.lvl:
          _completeLevel(isWin: true);
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
    final List<LetterInfo> newBoard = List.of(state.board)
      ..replaceRange(state.currentWordIndex * _wordLength, state.board.length, resultWord);
    final Map<String, LetterStatus> newStatuses = Map.of(state.statuses);
    for (final e in resultWord) {
      if (!newStatuses.containsKey(e.letter) ||
          newStatuses.containsKey(e.letter) && newStatuses[e.letter]! < e.status) {
        newStatuses[e.letter] = e.status;
      }
    }
    if (state.currentWordIndex >= _maxWords - 1) {
      emit(_buildLossState(board: newBoard, statuses: newStatuses));
      switch (state.gameMode) {
        case GameMode.daily:
          _saveDailyResult(board: newBoard, isWin: false);
        case GameMode.lvl:
          _completeLevel(isWin: false);
      }
    } else {
      emit(_buildIdleState(board: newBoard, statuses: newStatuses));
      switch (state.gameMode) {
        case GameMode.daily:
          _saveDailyResult(board: newBoard);
        case GameMode.lvl:
          _saveLevelProgress(board: newBoard);
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
