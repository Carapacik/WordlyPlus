import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/flushbar_types.dart';
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
    checkForAndroidUpdate();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkDailyDialog(context);
    });
  }

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
                  builder: (context) => const StatisticPage(),
                ),
              );
            },
            icon: const Icon(Icons.leaderboard_outlined),
          ),
        ],
      ),
      body: BlocListener<MainCubit, MainState>(
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
            await checkDailyDialog(context, isWin: true);
          } else if (state is LoseGameState) {
            await checkDailyDialog(context, isWin: false);
          }
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) =>
              previous.dictionaryLanguage != current.dictionaryLanguage,
          builder: (_, state) {
            return ConstraintScreen(
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
            );
          },
        ),
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
