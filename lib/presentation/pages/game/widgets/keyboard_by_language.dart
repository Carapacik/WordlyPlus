import 'package:flutter/material.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_en.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_ru.dart';

class KeyboardByLanguage extends StatelessWidget {
  const KeyboardByLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    const language = DictionaryEnum.en;
    switch (language) {
      case DictionaryEnum.ru:
        return const KeyboardRu();
      case DictionaryEnum.en:
        return const KeyboardEn();
    }
  }
}
