import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/daily_result.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/repositories/dauly_result_repository.dart';
import 'package:wordle/presentation/pages/main/widgets/keyboard_en.dart';
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
    return AdaptiveScaffold(
      child: BlocProvider<MainCubit>(
        create: (BuildContext context) => MainCubit(),
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
          buildWhen: (_, currState) => currState is MainInitial,
          builder: (context, state) {
            return Column(
              key: UniqueKey(),
              children: const [
                WordGrid(),
                Spacer(),
                KeyboardEn(),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showDialogIfNeed(
    final BuildContext context, {
    final bool? isWin,
  }) async {
    if (isWin == null) {
      final savedItem = await DailyResultRepository.getInstance().getItem();
      final dailyWord = DictionaryData.getInstance().secretWord;
      if (savedItem != null && savedItem.word == dailyWord) {
        await showWinLoseDialog(context, isWin: savedItem.isWin);
      }
    } else {
      DailyResultRepository.getInstance().setItem(
        DailyResult(
          isWin: isWin,
          word: DictionaryData.getInstance().secretWord,
        ),
      );
      await showWinLoseDialog(context, isWin: isWin);
    }
  }
}
