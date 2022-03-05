import 'package:flutter/material.dart';
import 'package:wordle/presentation/pages/main/widgets/grid.dart';
import 'package:wordle/presentation/pages/main/widgets/keyboard.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        Grid(),
        Spacer(),
        Keyboard(),
        SizedBox(height: 20),
      ],
    );
  }
}
