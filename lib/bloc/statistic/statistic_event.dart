part of 'statistic_bloc.dart';

@freezed
class StatisticEvent with _$StatisticEvent {
  const StatisticEvent._();

  const factory StatisticEvent.statisticLoad() = _StatisticLoadEvent;
}
