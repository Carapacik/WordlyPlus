import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/domain/shared_preferences_service.dart';

part 'dictionary_bloc.freezed.dart';
part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc({
    required this.spService,
    required DictionaryEnum dictionary,
  }) : super(DictionaryState.changeDictionary(dictionary)) {
    on<_DictionaryChangedEvent>(_onDictionaryChanged);
  }

  final SharedPreferencesService spService;

  Future<void> _onDictionaryChanged(
    _DictionaryChangedEvent event,
    Emitter<DictionaryState> emit,
  ) async {
    await spService.saveDictionary(event.dictionary);
    emit(DictionaryState.changeDictionary(event.dictionary));
  }
}
