part of 'levels_bloc.dart';

@freezed
class LevelsState with _$LevelsState {
  const LevelsState._();

  const factory LevelsState.initial() = _InitialState;

  const factory LevelsState.levelsLoaded(List levels) = _LevelsLoadedState;
}
