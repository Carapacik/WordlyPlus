import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/domain/level_repository.dart';
import 'package:wordly/presentation/pages/main/widgets/keyboard_en.dart';
import 'package:wordly/presentation/pages/main/widgets/keyboard_ru.dart';
import 'package:wordly/presentation/pages/main/widgets/word_grid.dart';
import 'package:wordly/presentation/pages/statistic/statistic_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkResultDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final levelRepository = GetIt.I<LevelRepository>();
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) async {
        if (state is TopMessageState) {
          switch (state.type) {
            case FlushBarTypes.notFound:
              await showTopFlushBar(
                context,
                message: R.stringsOf(context).word_not_found,
              );
              break;
            case FlushBarTypes.notCorrectLength:
              await showTopFlushBar(
                context,
                message: R.stringsOf(context).word_too_short,
              );
              break;
          }
        } else if (state is WinGameState) {
          await checkResultDialog(context, isWin: true);
        } else if (state is LoseGameState) {
          await checkResultDialog(context, isWin: false);
        }
      },
      buildWhen: (_, currentState) =>
          currentState is MainInitial || currentState is GridUpdateState,
      builder: (context, state) => BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) =>
            previous.dictionaryLanguage != current.dictionaryLanguage,
        builder: (context, state) {
          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: CustomAppBar(
              title: levelRepository.isLevelMode
                  ? R.stringsOf(context).level_number(
                        number: levelRepository.levelData.lastLevel,
                      )
                  : R.stringsOf(context).wordle.toUpperCase(),
              actions: [
                if (levelRepository.isLevelMode)
                  const SizedBox.shrink()
                // IconButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => const LevelsPage(),
                //       ),
                //     );
                //   },
                //   icon: const Icon(Icons.apps),
                // )
                else
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const StatisticPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.leaderboard),
                  ),
              ],
            ),
            body: ConstraintScreen(
              child: Column(
                key: UniqueKey(),
                children: [
                  const SizedBox(height: 8),
                  const WordsGrid(),
                  const Spacer(),
                  state.dictionaryLanguage.keyboard,
                  const SizedBox(height: 4),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

extension DictionaryLanguageKeyboard on DictionaryLanguages {
  Widget get keyboard {
    switch (this) {
      case DictionaryLanguages.ru:
        return const KeyboardRu();
      case DictionaryLanguages.en:
      default:
        return const KeyboardEn();
    }
  }
}
