import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.r.tutorial,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.r.tutorial,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          ),
        ),
      ),
    );
  }
}
