part of 'dictionary_bloc.dart';

@freezed
class DictionaryState with _$DictionaryState {
  const DictionaryState._();

  const factory DictionaryState.changeDictionary({required int dictionary}) =
      _ChangeDictionaryState;
}
