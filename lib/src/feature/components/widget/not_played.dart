import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/extensions/context_extension.dart';

class HaveNotPlayed extends StatelessWidget {
  const HaveNotPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Text(
          context.l10n.notPlayed,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
