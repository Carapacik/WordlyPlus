import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'statistic_state.dart';

class StatisticCubit extends Cubit<StatisticState> {
  StatisticCubit() : super(StatisticInitial());
}
