import 'package:flutter/material.dart';
import 'package:wordly/src/core/extension/extensions.dart';

class HaveNotPlayed extends StatelessWidget {
  const HaveNotPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Text(
          context.r.notPlayed,
          style: context.theme.tl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
