import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_by_language.dart';
import 'package:wordly/presentation/pages/game/widgets/word_grid.dart';
import 'package:wordly/presentation/pages/levels/levels_page.dart';
import 'package:wordly/presentation/pages/statistic/statistic_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          print(event.logicalKey.keyId);
          return;
        }
      },
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: CustomAppBar(
          title: '',
          actions: [
            if (true)
              IconButton(
                tooltip: context.r.view_levels,
                icon: const Icon(Icons.apps),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const LevelsPage(),
                    ),
                  );
                },
              )
            else
              IconButton(
                tooltip: context.r.view_statistic,
                icon: const Icon(Icons.leaderboard),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const StatisticPage(),
                    ),
                  );
                },
              ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            WordGrid(),
            Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: KeyboardByLanguage(),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
