import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'keyboard_bloc.freezed.dart';
part 'keyboard_event.dart';
part 'keyboard_state.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc() : super(const KeyboardState.initial()) {
    on<_KeyboardUpdateEvent>(_onKeyboardUpdate);
  }

  Map<String, LetterStatus> _keyboardInfo = {};

  void _onKeyboardUpdate(
    _KeyboardUpdateEvent event,
    Emitter<KeyboardState> emit,
  ) {}
}
