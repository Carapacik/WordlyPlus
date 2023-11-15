import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/app/data/dictionary_repository.dart';

part 'dictionary_bloc.freezed.dart';

/// Locale event for [DictionaryBloc]
@Freezed()
sealed class DictionaryEvent with _$DictionaryEvent {
  /// Updates the dictionary with the given [dictionary].
  const factory DictionaryEvent.update({required Locale dictionary}) = _DictionaryEventUpdate;
}

/// Dictionary state for [DictionaryBloc]
@Freezed()
sealed class DictionaryState with _$DictionaryState {
  /// Initial state of the dictionary bloc.
  const factory DictionaryState.idle({required Locale dictionary}) = _DictionaryStateIdle;

  /// State when the dictionary is being updated.
  const factory DictionaryState.inProgress({required Locale dictionary}) = _DictionaryStateInProgress;
}

/// Business Logic Component (BLoC) for managing the app's dictionary.
///
/// Emits a [DictionaryState] to represent the current dictionary state of the app.
/// Responds to [DictionaryEvent]s to update the dictionary state.
class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  /// Creates a new [DictionaryBloc] with the given [DictionaryRepository].
  ///
  /// The initial state is set to [DictionaryState.idle] with the dictionary loaded from
  /// the cache, or the default dictionary of 'en' if no
  /// dictionary is found in the cache.
  ///
  /// Responds to [DictionaryEvent.update] events by calling [_update] to update the
  /// dictionary state.
  DictionaryBloc({required DictionaryRepository dictionaryRepository})
      : _dictionaryRepository = dictionaryRepository,
        super(DictionaryState.idle(dictionary: dictionaryRepository.loadDictionaryFromCache() ?? const Locale('en'))) {
    on<DictionaryEvent>((event, emit) async => event.map(update: (e) => _update(e, emit)));
  }

  final DictionaryRepository _dictionaryRepository;

  /// Updates the current dictionary with the new dictionary from the given event.
  ///
  /// Emits a [DictionaryState.inProgress] state with a default dictionary of 'en'
  /// before calling [DictionaryRepository.setDictionary] to update the dictionary. If the
  /// update is successful, emits a [DictionaryState.idle] state with the new dictionary
  ///
  /// If there is an error during the update, logs a warning message with the
  /// error and emits a [DictionaryState.idle] state with default dictionary of 'en'.
  ///
  /// Throws any error that occurs during the update.
  Future<void> _update(_DictionaryEventUpdate event, Emitter<DictionaryState> emit) async {
    try {
      emit(const DictionaryState.inProgress(dictionary: Locale('en')));
      await _dictionaryRepository.setDictionary(event.dictionary);
      emit(DictionaryState.idle(dictionary: event.dictionary));
    } on Object catch (e) {
      logger.warning('Failed to update dictionary, $e');
      emit(const DictionaryState.idle(dictionary: Locale('en')));
      rethrow;
    }
  }
}
