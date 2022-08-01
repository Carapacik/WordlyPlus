import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/dictionary/dictionary_bloc.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_en.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_ru.dart';

class KeyboardByLanguage extends StatelessWidget {
  const KeyboardByLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.read<DictionaryBloc>().state.dictionary;
    switch (language) {
      case DictionaryEnum.ru:
        return const KeyboardRu();
      case DictionaryEnum.en:
        return const KeyboardEn();
    }
  }
}
