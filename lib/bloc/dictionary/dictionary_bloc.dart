import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_bloc.freezed.dart';
part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc(String dictionary)
      : super(DictionaryState.changeDictionary(dictionary: dictionary)) {
    on<_DictionaryChangedEvent>(_onDictionaryChanged);
  }

  void _onDictionaryChanged(
    _DictionaryChangedEvent event,
    Emitter<DictionaryState> emit,
  ) {
    emit(DictionaryState.changeDictionary(dictionary: event.dictionary));
  }
}
