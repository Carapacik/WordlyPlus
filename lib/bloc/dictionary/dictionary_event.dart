part of 'dictionary_bloc.dart';

@freezed
class DictionaryEvent with _$DictionaryEvent {
  const DictionaryEvent._();

  const factory DictionaryEvent.dictionaryChanged(DictionaryEnum dictionary) =
      _DictionaryChangedEvent;
}
