import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'levels_bloc.freezed.dart';
part 'levels_event.dart';
part 'levels_state.dart';

class LevelsBloc extends Bloc<LevelsEvent, LevelsState> {
  LevelsBloc() : super(const LevelsState.initial()) {
    on<_LevelsLoadEvent>(_onLevelsLoad);
  }

  void _onLevelsLoad(
    _LevelsLoadEvent event,
    Emitter<LevelsState> emit,
  ) {}
}
