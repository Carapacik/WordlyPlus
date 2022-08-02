import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/data/models/game_error.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_info.dart';
import 'package:wordly/domain/game_service.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required DictionaryEnum dictionary, required this.gameService})
      : _dictionary = dictionary,
        super(const GameState.initial()) {
    on<_LetterPressedEvent>(_onLetterPressed);
    on<_DeletePressedEvent>(_onDeletePressed);
    on<_DeleteLongPressedEvent>(_onDeleteLongPressed);
    on<_EnterPressedEvent>(_onEnterPressed);
    on<_ChangeDictionaryEvent>(_onChangeDictionary);
  }

  final SaveGameService gameService;
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

  void _onEnterPressed(
    _EnterPressedEvent event,
    Emitter<GameState> emit,
  ) {
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
      _updateColorsInGrid();

      _isGameComplete = true;
      _currentWordIndex++;
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
      emit(const GameState.win());
      return;
    }
    if (_currentWordIndex == 5) {
      _updateColorsInGrid();

      _isGameComplete = true;
      _currentWordIndex++;
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
      emit(const GameState.lose());
      return;
    }

    if (_dictionary.currentDictionary.containsKey(word)) {
      _updateColorsInGrid();

      _currentWordIndex++;
      emit(GameState.wordSubmit(board: _gridInfo, keyboard: ''));
    }
  }

  void _onChangeDictionary(
    _ChangeDictionaryEvent event,
    Emitter<GameState> emit,
  ) {
    _dictionary = event.dictionary;
  }

  void _updateColorsInGrid() {}

  String get _buildWord {
    return _gridInfo[_currentWordIndex * 5].letter +
        _gridInfo[_currentWordIndex * 5 + 1].letter +
        _gridInfo[_currentWordIndex * 5 + 2].letter +
        _gridInfo[_currentWordIndex * 5 + 3].letter +
        _gridInfo[_currentWordIndex * 5 + 4].letter;
  }
}
