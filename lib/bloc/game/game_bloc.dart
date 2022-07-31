import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/domain/game_service.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.dictionary, required this.gameService})
      : super(const GameState.initial()) {
    on<_LetterPressedEvent>(_onLetterPressed);
    on<_DeletePressedEvent>(_onDeletePressed);
    on<_EnterPressedEvent>(_onEnterPressed);
    on<_ChangeDictionaryEvent>(_onChangeDictionary);
  }

  final DictionaryEnum dictionary;
  final SaveGameService gameService;

  bool _isGameComplete = false;
  int _currentWordIndex = 0;
  String _secretWord = '';
  List<String> _gridInfo = [''];

  void _onLetterPressed(
    _LetterPressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length <= _currentWordIndex) {
      _gridInfo.add('');
    }
    if (_gridInfo[_currentWordIndex].length < 5) {
      _gridInfo[_currentWordIndex] = _gridInfo[_currentWordIndex] +
          (event.letter.fromDictionary(dictionary) ?? '');
      // TODO нормальная переменная для board List<LetterInfo>
      emit(const GameState.boardUpdate(board: ''));
    }
  }

  void _onDeletePressed(
    _DeletePressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_gridInfo.length <= _currentWordIndex) {
      _gridInfo.add('');
    }
    final wordLength = _gridInfo[_currentWordIndex].length;
    if (wordLength > 0) {
      _gridInfo[_currentWordIndex] =
          _gridInfo[_currentWordIndex].substring(0, wordLength - 1);
      // TODO нормальная переменная для board List<LetterInfo>
      emit(const GameState.boardUpdate(board: ''));
    }
  }

  void _onEnterPressed(
    _EnterPressedEvent event,
    Emitter<GameState> emit,
  ) {
    // TODO
  }

  void _onChangeDictionary(
    _ChangeDictionaryEvent event,
    Emitter<GameState> emit,
  ) {
    // TODO
  }
}
