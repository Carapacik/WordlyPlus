import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

/// A function that maps an event of type [Event] to a stream of events.
abstract base class BlocTransformer<Event> {
  BlocTransformer();

  /// Transforms the given [stream] of events.
  Stream<E> transform<E>(Stream<E> stream, EventMapper<E> mapper);
}

/// Sequentially maps events to a stream of events.
final class SequentialBlocTransformer extends BlocTransformer<Object?> {
  SequentialBlocTransformer();

  @override
  Stream<Event> transform<Event>(
    Stream<Event> stream,
    EventMapper<Event> mapper,
  ) =>
      stream.asyncExpand(mapper);
}

final class DenounceRestartableBlocTransformer extends BlocTransformer<Object?> {
  DenounceRestartableBlocTransformer([Duration? duration]) : _duration = duration ?? const Duration(milliseconds: 700);

  final Duration _duration;

  @override
  Stream<Event> transform<Event>(
    Stream<Event> stream,
    EventMapper<Event> mapper,
  ) =>
      stream.debounceTime(_duration).switchMap(mapper);
}
