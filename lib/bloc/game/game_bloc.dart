import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc(this.dictionary) : super(const GameState.initial()) {
    on<_LetterPressedEvent>(_onLetterPressed);
    on<_DeletePressedEvent>(_onDeletePressed);
    on<_EnterPressedEvent>(_onEnterPressed);
    on<_ChangeDictionaryEvent>(_onChangeDictionary);
  }

  final int dictionary;

  void _onLetterPressed(
    _LetterPressedEvent event,
    Emitter<GameState> emit,
  ) {}

  void _onDeletePressed(
    _DeletePressedEvent event,
    Emitter<GameState> emit,
  ) {}

  void _onEnterPressed(
    _EnterPressedEvent event,
    Emitter<GameState> emit,
  ) {}

  void _onChangeDictionary(
    _ChangeDictionaryEvent event,
    Emitter<GameState> emit,
  ) {}
}
