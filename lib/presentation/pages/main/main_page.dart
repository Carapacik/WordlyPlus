import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/daily_result.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/game_statistic.dart';
import 'package:wordle/data/repositories/dauly_result_repository.dart';
import 'package:wordle/data/repositories/game_statistic_repository.dart';
import 'package:wordle/data/repositories/statistic_repository.dart';
import 'package:wordle/presentation/pages/main/widgets/keyboard_en.dart';
import 'package:wordle/presentation/pages/main/widgets/keyboard_ru.dart';
import 'package:wordle/presentation/pages/main/widgets/word_grid.dart';
import 'package:wordle/presentation/widgets/adaptive_scaffold.dart';
import 'package:wordle/presentation/widgets/dialogs/top_flush_bar.dart';
import 'package:wordle/presentation/widgets/dialogs/win_lose.dart';
import 'package:wordle/resources/r.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showDialogIfNeed(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (BuildContext context) => MainCubit(),
      child: AdaptiveScaffold(
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is TopMessageState) {
              switch (state.type) {
                case FlushBarTypes.notFound:
                  showTopFlushBar(
                    context,
                    message: R.stringsOf(context).word_not_found,
                  );
                  break;
                case FlushBarTypes.notCorrectLength:
                  showTopFlushBar(
                    context,
                    message: R.stringsOf(context).word_too_short,
                  );
                  break;
              }
            } else if (state is WinGameState) {
              _showDialogIfNeed(context, isWin: true);
            } else if (state is LoseGameState) {
              _showDialogIfNeed(context, isWin: false);
            }
          },
          buildWhen: (_, currState) => currState is ChangeDictionaryState,
          builder: (context, state) {
            return Column(
              key: UniqueKey(),
              children: [
                const WordGrid(),
                const Spacer(),
                BlocBuilder<MainCubit, MainState>(
                  buildWhen: (previous, current) =>
                      current is ChangeDictionaryState,
                  builder: (context, state) => _getKeyboardByLanguage(
                    state is! ChangeDictionaryState ? "en" : state.dictionary,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getKeyboardByLanguage(final String language) {
    switch (language) {
      case "ru":
        return const KeyboardRu();
      case "en":
      default:
        return const KeyboardEn();
    }
  }

  Future<void> _showDialogIfNeed(
    final BuildContext context, {
    final bool? isWin,
  }) async {
    final savedStatistic =
        await GameStatisticRepository.getInstance().getItem() ??
            const GameStatistic();
    if (isWin != null) {
      Statistic statistic = GetIt.I.get<Statistic>();
      GetIt.I.unregister<Statistic>();
      final attemptNumber = DictionaryData.getInstance().currentWordIndex;
      DailyResultRepository.getInstance().setItem(
        DailyResult(
          isWin: isWin,
          word: DictionaryData.getInstance().secretWord,
        ),
      );
      late GameStatistic newStatistic;
      if (isWin) {
        newStatistic = savedStatistic.copyWith(
          wins: savedStatistic.wins + 1,
          currentStreak: savedStatistic.currentStreak + 1,
          maxStreak: savedStatistic.currentStreak + 1 > savedStatistic.maxStreak
              ? savedStatistic.currentStreak
              : savedStatistic.maxStreak,
        );
        Tries tries = statistic.tries;
        switch (attemptNumber) {
          case 1:
            tries = tries.copyWith(first: tries.first + 1);
            break;
          case 2:
            tries = tries.copyWith(second: tries.second + 1);
            break;
          case 3:
            tries = tries.copyWith(third: tries.third + 1);
            break;
          case 4:
            tries = tries.copyWith(fourth: tries.fourth + 1);
            break;
          case 5:
            tries = tries.copyWith(fifth: tries.fifth + 1);
            break;
          case 6:
            tries = tries.copyWith(sixth: tries.sixth + 1);
            break;
          default:
            break;
        }
        final double wins = (statistic.win + 1).toDouble();
        final double losses = statistic.loses.toDouble();
        final double total = wins + losses;
        var winRate = 0.toDouble();
        if (losses == 0 && wins != 0) {
          winRate = 100.toDouble();
        } else if (losses != 0 && wins != 0) {
          winRate = (wins / total) * 100;
        }
        statistic = statistic.copyWith(
          win: statistic.win + 1,
          currentStreak: statistic.currentStreak + 1,
          maxStreak: statistic.currentStreak + 1 > statistic.maxStreak
              ? statistic.currentStreak + 1
              : statistic.maxStreak,
          tries: tries,
          winRate: winRate,
        );
      } else {
        final double wins = (statistic.win).toDouble();
        final double losses = (statistic.loses + 1).toDouble();
        final double total = wins + losses;
        var winRate = 0.toDouble();
        if (losses == 0 && wins != 0) {
          winRate = 100.toDouble();
        } else if (losses != 0 && wins != 0) {
          winRate = (wins / total) * 100;
        }
        newStatistic = savedStatistic.copyWith(
          loses: savedStatistic.loses + 1,
          currentStreak: 0,
        );
        statistic = statistic.copyWith(
          loses: statistic.loses + 1,
          currentStreak: 0,
          winRate: winRate,
        );
      }
      GetIt.I.registerLazySingleton<Statistic>(() => statistic);
      AuthRepository().currentUser.isEmpty
          ? await StatisticRepository.getInstance().setItem(statistic)
          : AuthRepository().updateStatistic(statistic);
      await GameStatisticRepository.getInstance().setItem(newStatistic);
      if (!mounted) return;
      await showWinLoseDialog(
        context,
        isWin: isWin,
        statistic: newStatistic,
      );
    } else {
      final savedItem = await DailyResultRepository.getInstance().getItem();
      final dailyWord = DictionaryData.getInstance().secretWord;
      if (savedItem != null && savedItem.word == dailyWord) {
        if (!mounted) return;
        await showWinLoseDialog(
          context,
          isWin: savedItem.isWin,
          statistic: savedStatistic,
        );
      }
    }
  }
}
