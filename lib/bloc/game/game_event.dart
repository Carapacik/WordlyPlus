part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const GameEvent._();

  const factory GameEvent.letterPressed(KeyboardKeys letter) =
      _LetterPressedEvent;

  const factory GameEvent.deletePressed() = _DeletePressedEvent;

  const factory GameEvent.enterPressed() = _EnterPressedEvent;

  const factory GameEvent.changeDictionary({required int dictionary}) =
      _ChangeDictionaryEvent;
}
