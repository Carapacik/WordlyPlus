import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic_bloc.freezed.dart';
part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(const StatisticState.initial()) {
    on<_StatisticLoadEvent>(_onStatisticLoad);
  }

  void _onStatisticLoad(
    _StatisticLoadEvent event,
    Emitter<StatisticState> emit,
  ) {}
}
