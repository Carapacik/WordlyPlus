part of 'levels_bloc.dart';

@freezed
class LevelsEvent with _$LevelsEvent {
  const LevelsEvent._();

  const factory LevelsEvent.levelsLoad() = _LevelsLoadEvent;
}
