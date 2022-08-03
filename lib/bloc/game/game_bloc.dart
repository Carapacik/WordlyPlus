import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/domain/save_game_service.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required DictionaryEnum dictionary, required this.saveGameService})
      : _dictionary = dictionary,
        super(const GameState.initial()) {
    on<_LetterPressedEvent>(_onLetterPressed);
    on<_DeletePressedEvent>(_onDeletePressed);
    on<_DeleteLongPressedEvent>(_onDeleteLongPressed);
    on<_EnterPressedEvent>(_onEnterPressed);
    on<_ChangeDictionaryEvent>(_onChangeDictionary);
  }

  final SaveGameService saveGameService;
  DictionaryEnum _dictionary;
  List<LetterInfo> _gridInfo = [];
  bool _isGameComplete = false;
  int _currentWordIndex = 0;
  String _secretWord = 'crane';

  void _onLetterPressed(
    _LetterPressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length < (_currentWordIndex + 1) * 5) {
      final newList = List<LetterInfo>.of(_gridInfo)
        ..add(LetterInfo(letter: event.letter.fromDictionary(_dictionary)!));
      _gridInfo = newList;
      emit(GameState.boardUpdate(newList));
    }
  }

  void _onDeletePressed(
    _DeletePressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length > _currentWordIndex * 5) {
      final newList = List<LetterInfo>.of(_gridInfo)..removeLast();
      _gridInfo = newList;
      emit(GameState.boardUpdate(newList));
    }
  }

  void _onDeleteLongPressed(
    _DeleteLongPressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length > _currentWordIndex * 5) {
      final newList = List<LetterInfo>.of(_gridInfo)
        ..removeRange(_currentWordIndex * 5, _gridInfo.length);
      _gridInfo = newList;
      emit(GameState.boardUpdate(newList));
    }
  }

  Future<void> _onEnterPressed(
    _EnterPressedEvent event,
    Emitter<GameState> emit,
  ) async {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.isEmpty || _gridInfo.length % 5 != 0) {
      emit(const GameState.error(GameError.tooShort));
      return;
    }
    final word = _buildWord;
    if (!_dictionary.currentDictionary.containsKey(word)) {
      emit(const GameState.error(GameError.notFound));
      return;
    }
    if (word == _secretWord) {
      _gridInfo.replaceRange(
        _gridInfo.length - 5,
        _gridInfo.length,
        _colorTheWord,
      );
      _isGameComplete = true;

      await saveGameService.saveDailyBoard(_gridInfo, _dictionary);
      await saveGameService.saveDailyWord(_secretWord, _dictionary);
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
      emit(
        GameState.complete(
          GameResult(
            isWin: true,
            word: _secretWord,
            meaning: _dictionary.currentDictionary[_secretWord] ?? '',
          ),
        ),
      );
      return;
    }
    if (_currentWordIndex == 5) {
      _gridInfo.replaceRange(
        _gridInfo.length - 5,
        _gridInfo.length,
        _colorTheWord,
      );

      _isGameComplete = true;

      await saveGameService.saveDailyBoard(_gridInfo, _dictionary);
      await saveGameService.saveDailyWord(_secretWord, _dictionary);
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
      emit(
        GameState.complete(
          GameResult(
            isWin: false,
            word: _secretWord,
            meaning: _dictionary.currentDictionary[_secretWord] ?? '',
          ),
        ),
      );
      return;
    }

    if (_dictionary.currentDictionary.containsKey(word)) {
      _gridInfo.replaceRange(
        _gridInfo.length - 5,
        _gridInfo.length,
        _colorTheWord,
      );
      await saveGameService.saveDailyBoard(_gridInfo, _dictionary);
      await saveGameService.saveDailyWord(_secretWord, _dictionary);
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
    }
  }

  void _onChangeDictionary(
    _ChangeDictionaryEvent event,
    Emitter<GameState> emit,
  ) {
    _dictionary = event.dictionary;
  }

  void _generateSecretWord({int levelNumber = 0}) {
    late int index;
    if (levelNumber == 0) {
      final now = DateTime.now();
      final random = Random(now.year * 1000 + now.month * 100 + now.day);
      index = random.nextInt(_dictionary.currentDictionary.length);
    } else {
      index = Random(levelNumber).nextInt(_dictionary.currentDictionary.length);
    }
    _secretWord = _dictionary.currentDictionary.keys.elementAt(index);
  }

  List<LetterInfo> get _colorTheWord {
    final updatedList = <LetterInfo>[];
    final word = _buildWord;

    for (var i = 0; i < word.length; i++) {
      final character = word[i];
      var letterStatus = LetterStatus.unknown;
      if (character == _secretWord[i]) {
        letterStatus = LetterStatus.correctSpot;
      } else if (_secretWord.contains(character)) {
        letterStatus = LetterStatus.wrongSpot;
      } else {
        letterStatus = LetterStatus.notInWord;
      }
      updatedList.add(
        LetterInfo(letter: character, letterStatus: letterStatus),
      );
    }

    _currentWordIndex++;
    return updatedList;
  }

  String get _buildWord {
    return _gridInfo[_currentWordIndex * 5].letter +
        _gridInfo[_currentWordIndex * 5 + 1].letter +
        _gridInfo[_currentWordIndex * 5 + 2].letter +
        _gridInfo[_currentWordIndex * 5 + 3].letter +
        _gridInfo[_currentWordIndex * 5 + 4].letter;
  }
}
