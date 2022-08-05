import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/domain/save_levels_service.dart';

part 'levels_bloc.freezed.dart';
part 'levels_event.dart';
part 'levels_state.dart';

class LevelsBloc extends Bloc<LevelsEvent, LevelsState> {
  LevelsBloc(this.saveLevelsService) : super(const LevelsState.initial()) {
    on<_LevelsLoadEvent>(_onLevelsLoad);
  }

  final ISaveLevelsService saveLevelsService;

  Future<void> _onLevelsLoad(
    _LevelsLoadEvent event,
    Emitter<LevelsState> emit,
  ) async {
    final levels = await saveLevelsService.getLevels(event.dictionary) ?? [];
    emit(LevelsState.levelsLoaded(levels));
  }
}
