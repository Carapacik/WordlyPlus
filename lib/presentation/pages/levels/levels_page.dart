import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/level/level_cubit.dart';
import 'package:wordly/presentation/pages/level_menu/level_menu_page.dart';
import 'package:wordly/presentation/pages/main/widgets/word_grid.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: R.stringsOf(context).wordle.toUpperCase(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LevelMenuPage(),
                ),
              );
            },
            icon: const Icon(Icons.apps),
          ),
        ],
      ),
      body: BlocListener<LevelCubit, LevelState>(
        listener: (context, state) {
          // if (state is TopMessageState) {
          //   switch (state.type) {
          //     case FlushBarTypes.notFound:
          //       await showTopFlushBar(
          //         context,
          //         message: R.stringsOf(context).word_not_found,
          //       );
          //       break;
          //     case FlushBarTypes.notCorrectLength:
          //       await showTopFlushBar(
          //         context,
          //         message: R.stringsOf(context).word_too_short,
          //       );
          //       break;
          //   }
          // } else if (state is WinGameState) {
          //   await checkDailyDialog(context, isWin: true);
          // } else if (state is LoseGameState) {
          //   await checkDailyDialog(context, isWin: false);
          // }
        },
        child: ConstraintScreen(
          child: Column(
            key: UniqueKey(),
            children: [
              const SizedBox(height: 8),
              const WordsGrid(),
              const Spacer(),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
