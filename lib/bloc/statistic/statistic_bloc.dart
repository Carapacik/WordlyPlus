import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/domain/save_statistic_service.dart';

part 'statistic_bloc.freezed.dart';

part 'statistic_event.dart';

part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc(this.saveStatisticService, this.dictionary)
      : super(const StatisticState.initial()) {
    on<_StatisticLoadEvent>(_onStatisticLoad);
  }

  final ISaveStatisticService saveStatisticService;
  final DictionaryEnum dictionary;

  Future<void> _onStatisticLoad(
    _StatisticLoadEvent event,
    Emitter<StatisticState> emit,
  ) async {
    final statistic =
        await saveStatisticService.getDailyStatistic(dictionary);
    emit(StatisticState.statisticLoaded(statistic));
  }
}
