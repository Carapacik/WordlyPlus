import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordly/src/feature/app/widget/locale_scope.dart';

class KeyboardByLanguage extends StatelessWidget {
  const KeyboardByLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: switch (LocaleScope.of(context).locale) {
        const Locale('en') => const KeyboardEn(),
        const Locale('ru') => const Text('RU'),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class KeyboardEn extends StatelessWidget {
  const KeyboardEn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [for (var i = 0; i < 10; i++) const KeyboardKey()],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [for (var i = 0; i < 9; i++) const KeyboardKey()],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const EnterKey(),
            for (var i = 0; i < 7; i++) const KeyboardKey(),
            const DeleteKey(),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

extension on Locale {
  double width(BuildContext context) {
    return switch (this) {
      const Locale('en') => min(MediaQuery.sizeOf(context).width, 520) - 11 * 6,
      const Locale('ru') => min(MediaQuery.sizeOf(context).width, 520) - 11 * 6,
      _ => 0,
    };
  }
}

class EnterKey extends StatelessWidget {
  const EnterKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: LocaleScope.of(context).locale.width(context) / 6,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey),
    );
  }
}

class DeleteKey extends StatelessWidget {
  const DeleteKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: LocaleScope.of(context).locale.width(context) / 6,
      margin: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: LocaleScope.of(context).locale.width(context) / 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey),
    );
  }
}
