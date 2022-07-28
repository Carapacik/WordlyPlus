part of 'keyboard_bloc.dart';

@freezed
class KeyboardState with _$KeyboardState {
  const KeyboardState._();

  const factory KeyboardState.initial() = _InitialState;

  const factory KeyboardState.updated(
    Map<KeyboardKeys, String> keyboard,
  ) = _UpdatedState;
}
