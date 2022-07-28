import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models/keyboard_keys.dart';

part 'keyboard_bloc.freezed.dart';
part 'keyboard_event.dart';
part 'keyboard_state.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc() : super(KeyboardState.initial()) {
    on<_KeyboardUpdateEvent>(_onKeyboardUpdate);
  }

  void _onKeyboardUpdate(
    _KeyboardUpdateEvent event,
    Emitter<KeyboardState> emit,
  ) {}
}
