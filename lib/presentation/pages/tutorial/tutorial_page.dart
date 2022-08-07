import 'package:flutter/material.dart';
import 'package:wordly/presentation/pages/game/game_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) => Title(
        color: AppColors.bgDark,
        title: context.r.how_to_play,
        child: Scaffold(
          appBar: CustomAppBar(title: context.r.how_to_play),
          body: Center(
            child: Column(
              children: [
                Text(context.r.how_to_play),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(
                        builder: (context) => const GamePage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('PLAY'),
                ),
              ],
            ),
          ),
        ),
      );
}
