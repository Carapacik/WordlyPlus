import 'package:flutter/material.dart';
import 'package:wordle/presentation/pages/main/widgets/keyboard.dart';

import 'grid.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: const [
          Grid(),
          Spacer(
            flex: 2,
          ),
          Keyboard(),
          Spacer(),
        ],
      ),
    );
  }
}
