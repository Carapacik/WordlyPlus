part of 'keyboard_bloc.dart';

@freezed
class KeyboardEvent with _$KeyboardEvent {
  const KeyboardEvent._();

  const factory KeyboardEvent.updateKeyboard(
    Map<KeyboardKeys, String> keyboard,
  ) = _KeyboardUpdateEvent;
}
