import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/core/utils/pattern_match.dart';
import 'package:wordly/src/feature/app/data/dictionary_repository.dart';

/// {@template dictionary_state}
/// Dictionary state
/// {@endtemplate}
@immutable
sealed class DictionaryState extends _DictionaryStateBase {
  /// {@macro dictionary_state}
  const DictionaryState();

  /// The state machine is idling (i.e. doing nothing)
  const factory DictionaryState.idle({
    required Locale dictionary,
  }) = _DictionaryStateIdle;

  /// The state machine is in progress (i.e. doing something)
  const factory DictionaryState.inProgress({
    required Locale dictionary,
  }) = _DictionaryStateInProgress;
}

/// {@macro dictionary_state}
///
/// This state is used when the
/// state machine is idling (i.e. doing nothing)
final class _DictionaryStateIdle extends DictionaryState {
  const _DictionaryStateIdle({
    required this.dictionary,
  });

  @override
  final Locale dictionary;

  @override
  String toString() => 'DictionaryState.idle(dictionary: $dictionary)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _DictionaryStateIdle && dictionary == other.dictionary);

  @override
  int get hashCode => dictionary.hashCode;
}

/// {@macro dictionary_state}
///
/// This state is used when the
/// state machine is in progress (i.e. doing something)
final class _DictionaryStateInProgress extends DictionaryState {
  const _DictionaryStateInProgress({
    required this.dictionary,
  });

  @override
  final Locale dictionary;

  @override
  String toString() => 'DictionaryState.inProgress()';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _DictionaryStateInProgress && dictionary == other.dictionary);

  @override
  int get hashCode => dictionary.hashCode;
}

abstract base class _DictionaryStateBase {
  const _DictionaryStateBase();

  /// The current dictionary in state
  Locale get dictionary;

  T map<T>({
    required PatternMatch<T, _DictionaryStateIdle> idle,
    required PatternMatch<T, _DictionaryStateInProgress> inProgress,
  }) =>
      switch (this) {
        final _DictionaryStateIdle state => idle(state),
        final _DictionaryStateInProgress state => inProgress(state),
        _ => throw AssertionError('Unknown state: $this'),
      };

  T maybeMap<T>({
    required PatternMatch<T, _DictionaryStateIdle>? idle,
    required PatternMatch<T, _DictionaryStateInProgress>? inProgress,
    required T orElse,
  }) =>
      map(
        idle: idle ?? (_) => orElse,
        inProgress: inProgress ?? (_) => orElse,
      );
}

/// Sealed class representing events that can be sent to the [DictionaryBloc].
///
/// Extends [_DictionaryEventBase] to provide a common base class for all events.
///
/// Provides a single event, [DictionaryEvent.update], which is used to update the
/// app's dictionary with the given [Dictionary].
@immutable
sealed class DictionaryEvent extends _DictionaryEventBase {
  /// Creates a new [DictionaryEvent].
  ///
  /// Provides a common base class for all events that can be sent to the
  /// [DictionaryBloc].
  const DictionaryEvent();

  /// Updates the app's dictionary with the given [Dictionary].
  const factory DictionaryEvent.update(Locale dictionary) = _DictionaryEventUpdate;
}

/// This event is used when the
/// dictionary is updated
final class _DictionaryEventUpdate extends DictionaryEvent {
  const _DictionaryEventUpdate(this.dictionary);

  /// The new dictionary
  final Locale dictionary;

  @override
  String toString() => 'DictionaryEvent.update(dictionary: $dictionary)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is _DictionaryEventUpdate && dictionary == other.dictionary);

  @override
  int get hashCode => dictionary.hashCode;
}

abstract base class _DictionaryEventBase {
  const _DictionaryEventBase();

  T map<T>({
    required PatternMatch<T, _DictionaryEventUpdate> update,
  }) =>
      switch (this) {
        final _DictionaryEventUpdate event => update(event),
        _ => throw AssertionError('Unknown event: $this'),
      };

  T maybeMap<T>({
    required PatternMatch<T, _DictionaryEventUpdate>? update,
    required T orElse,
  }) =>
      map(
        update: update ?? (_) => orElse,
      );
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
  DictionaryBloc({
    required DictionaryRepository dictionaryRepository,
  })  : _dictionaryRepository = dictionaryRepository,
        super(
          DictionaryState.idle(
            dictionary: dictionaryRepository.loadDictionaryFromCache() ?? const Locale('en'),
          ),
        ) {
    on<DictionaryEvent>(
      (event, emit) => event.map(
        update: (e) => _update(e, emit),
      ),
    );
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
  Future<void> _update(
    _DictionaryEventUpdate event,
    Emitter<DictionaryState> emit,
  ) async {
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
