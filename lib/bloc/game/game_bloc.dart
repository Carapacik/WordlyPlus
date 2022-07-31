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
  List<LetterInfo> _gridInfo = [];

  void _onLetterPressed(
    _LetterPressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length / (_currentWordIndex + 1) < 5) {
      _gridInfo.add(
        LetterInfo(letter: event.letter.fromDictionary(dictionary)!),
      );
      emit(GameState.boardUpdate(_gridInfo));
    }
  }

  void _onDeletePressed(
    _DeletePressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_isGameComplete) {
      return;
    }
    if (_gridInfo.length % 5 > 0) {
      _gridInfo.removeLast();
      emit(GameState.boardUpdate(_gridInfo));
    }
  }

  void _onEnterPressed(
    _EnterPressedEvent event,
    Emitter<GameState> emit,
  ) {
    if (_gridInfo.length % 5 != 0) {
      emit(const GameState.error(GameError.tooShort));
      return;
    }

    // If not in dictionary
    emit(const GameState.error(GameError.notFound));

    // If success
    emit(GameState.boardUpdate(_gridInfo));
    emit(GameState.wordSubmit(_gridInfo));
  }

  void _onChangeDictionary(
    _ChangeDictionaryEvent event,
    Emitter<GameState> emit,
  ) {
    // TODO
  }
}
