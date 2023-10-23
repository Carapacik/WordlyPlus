import 'dart:math' show min;

import 'package:flutter/material.dart';

class KeyboardList {
  static const (List<String>, List<String>, List<String>) enKeyboard = (
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
    ['z', 'x', 'c', 'v', 'b', 'n', 'm'],
  );

  static const (List<String>, List<String>, List<String>) ruKeyboard = (
    ['й', 'ц', 'у', 'к', 'е', 'н', 'г', 'ш', 'щ', 'з', 'х', 'ъ'],
    ['ф', 'ы', 'в', 'а', 'п', 'р', 'о', 'л', 'д', 'ж', 'э'],
    ['я', 'ч', 'с', 'м', 'и', 'т', 'ь', 'б', 'ю'],
  );
}

extension LocaleKeyboardX on Locale {
  double width(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    switch (this) {
      case const Locale('en'):
        final maxKeyboardLength = KeyboardList.enKeyboard.$1.length;
        return (min(screenWidth, 520) - (maxKeyboardLength + 1) * 6) / maxKeyboardLength;
      case const Locale('ru'):
        final maxKeyboardLength = KeyboardList.ruKeyboard.$1.length;
        return (min(screenWidth, 520) - (maxKeyboardLength + 1) * 6) / maxKeyboardLength;
    }
    return 0;
  }
}
