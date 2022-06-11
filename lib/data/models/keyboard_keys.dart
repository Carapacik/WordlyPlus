import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:wordly/data/models/dictionary_languages.dart';

enum KeyboardKeys {
  q('й', 'q', LogicalKeyboardKey(1081), LogicalKeyboardKey.keyQ),
  w('ц', 'w', LogicalKeyboardKey(1094), LogicalKeyboardKey.keyW),
  e('у', 'e', LogicalKeyboardKey(1091), LogicalKeyboardKey.keyE),
  r('к', 'r', LogicalKeyboardKey(1082), LogicalKeyboardKey.keyR),
  t('е', 't', LogicalKeyboardKey(1077), LogicalKeyboardKey.keyT),
  y('н', 'y', LogicalKeyboardKey(1085), LogicalKeyboardKey.keyY),
  u('г', 'u', LogicalKeyboardKey(1075), LogicalKeyboardKey.keyU),
  i('ш', 'i', LogicalKeyboardKey(1096), LogicalKeyboardKey.keyI),
  o('щ', 'o', LogicalKeyboardKey(1097), LogicalKeyboardKey.keyO),
  p('з', 'p', LogicalKeyboardKey(1079), LogicalKeyboardKey.keyP),
  a1('х', null, LogicalKeyboardKey(1093), null),
  a2('ъ', null, LogicalKeyboardKey(1098), null),
  a('ф', 'a', LogicalKeyboardKey(1092), LogicalKeyboardKey.keyA),
  s('ы', 's', LogicalKeyboardKey(1099), LogicalKeyboardKey.keyS),
  d('в', 'd', LogicalKeyboardKey(1074), LogicalKeyboardKey.keyD),
  f('а', 'f', LogicalKeyboardKey(1072), LogicalKeyboardKey.keyF),
  g('п', 'g', LogicalKeyboardKey(1087), LogicalKeyboardKey.keyG),
  h('р', 'h', LogicalKeyboardKey(1088), LogicalKeyboardKey.keyH),
  j('о', 'j', LogicalKeyboardKey(1086), LogicalKeyboardKey.keyJ),
  k('л', 'k', LogicalKeyboardKey(1083), LogicalKeyboardKey.keyK),
  l('д', 'l', LogicalKeyboardKey(1076), LogicalKeyboardKey.keyL),
  b1('ж', null, LogicalKeyboardKey(1078), null),
  b2('э', null, LogicalKeyboardKey(1101), null),
  z('я', 'z', LogicalKeyboardKey(1103), LogicalKeyboardKey.keyZ),
  x('ч', 'x', LogicalKeyboardKey(1095), LogicalKeyboardKey.keyX),
  c('с', 'c', LogicalKeyboardKey(1089), LogicalKeyboardKey.keyC),
  v('м', 'v', LogicalKeyboardKey(1084), LogicalKeyboardKey.keyV),
  b('и', 'b', LogicalKeyboardKey(1080), LogicalKeyboardKey.keyB),
  n('т', 'n', LogicalKeyboardKey(1090), LogicalKeyboardKey.keyN),
  m('ь', 'm', LogicalKeyboardKey(1100), LogicalKeyboardKey.keyM),
  c1('б', null, LogicalKeyboardKey(1073), null),
  c2('ю', null, LogicalKeyboardKey(1102), null),
  enter(null, null, null, null),
  delete(null, null, null, null);

  const KeyboardKeys(
    this.ruName,
    this.enName,
    this.ruKey,
    this.enKey,
  );

  final String? ruName;
  final LogicalKeyboardKey? ruKey;
  final String? enName;
  final LogicalKeyboardKey? enKey;

  static KeyboardKeys? fromLogicalKey(final LogicalKeyboardKey logicalKey) =>
      KeyboardKeys.values.firstWhereOrNull(
        (element) => element.notNullKeys.contains(logicalKey),
      );
}

const _defaultWidthRu = 0.067;
const _defaultWidthEn = 0.08;

extension KeyboardKeyExtension on KeyboardKeys {
  List<LogicalKeyboardKey> get notNullKeys {
    final list = <LogicalKeyboardKey>[];
    if (ruKey != null) {
      list.add(ruKey!);
    }
    if (enKey != null) {
      list.add(enKey!);
    }
    return list;
  }

  double width({
    required final DictionaryLanguages language,
    required final double screenWidth,
  }) {
    final parentWidth = screenWidth > 400 ? 400 : screenWidth;
    if (this == KeyboardKeys.delete) {
      switch (language) {
        case DictionaryLanguages.ru:
          return parentWidth * _defaultWidthRu / 2 * 3.5;
        case DictionaryLanguages.en:
          return parentWidth * _defaultWidthEn / 2 * 2.8;
      }
    }
    if (this == KeyboardKeys.enter) {
      switch (language) {
        case DictionaryLanguages.ru:
          return parentWidth * _defaultWidthRu / 2 * 3.5;
        case DictionaryLanguages.en:
          return parentWidth * _defaultWidthEn / 2 * 2.8;
      }
    }
    switch (language) {
      case DictionaryLanguages.ru:
        return parentWidth * _defaultWidthRu;
      case DictionaryLanguages.en:
        return parentWidth * _defaultWidthEn;
    }
  }

  String? name(final DictionaryLanguages lang) {
    switch (lang) {
      case DictionaryLanguages.ru:
        switch (this) {
          case KeyboardKeys.q:
            return 'й';
          case KeyboardKeys.w:
            return 'ц';
          case KeyboardKeys.e:
            return 'у';
          case KeyboardKeys.r:
            return 'к';
          case KeyboardKeys.t:
            return 'е';
          case KeyboardKeys.y:
            return 'н';
          case KeyboardKeys.u:
            return 'г';
          case KeyboardKeys.i:
            return 'ш';
          case KeyboardKeys.o:
            return 'щ';
          case KeyboardKeys.p:
            return 'з';
          case KeyboardKeys.a1:
            return 'х';
          case KeyboardKeys.a2:
            return 'ъ';
          case KeyboardKeys.a:
            return 'ф';
          case KeyboardKeys.s:
            return 'ы';
          case KeyboardKeys.d:
            return 'в';
          case KeyboardKeys.f:
            return 'а';
          case KeyboardKeys.g:
            return 'п';
          case KeyboardKeys.h:
            return 'р';
          case KeyboardKeys.j:
            return 'о';
          case KeyboardKeys.k:
            return 'л';
          case KeyboardKeys.l:
            return 'д';
          case KeyboardKeys.b1:
            return 'ж';
          case KeyboardKeys.b2:
            return 'э';
          case KeyboardKeys.enter:
            return 'Ввод';
          case KeyboardKeys.z:
            return 'я';
          case KeyboardKeys.x:
            return 'ч';
          case KeyboardKeys.c:
            return 'с';
          case KeyboardKeys.v:
            return 'м';
          case KeyboardKeys.b:
            return 'и';
          case KeyboardKeys.n:
            return 'т';
          case KeyboardKeys.m:
            return 'ь';
          case KeyboardKeys.c1:
            return 'б';
          case KeyboardKeys.c2:
            return 'ю';
          case KeyboardKeys.delete:
            break;
        }
        break;
      case DictionaryLanguages.en:
        switch (this) {
          case KeyboardKeys.q:
            return 'q';
          case KeyboardKeys.w:
            return 'w';
          case KeyboardKeys.e:
            return 'e';
          case KeyboardKeys.r:
            return 'r';
          case KeyboardKeys.t:
            return 't';
          case KeyboardKeys.y:
            return 'y';
          case KeyboardKeys.u:
            return 'u';
          case KeyboardKeys.i:
            return 'i';
          case KeyboardKeys.o:
            return 'o';
          case KeyboardKeys.p:
            return 'p';
          case KeyboardKeys.a:
            return 'a';
          case KeyboardKeys.s:
            return 's';
          case KeyboardKeys.d:
            return 'd';
          case KeyboardKeys.f:
            return 'f';
          case KeyboardKeys.g:
            return 'g';
          case KeyboardKeys.h:
            return 'h';
          case KeyboardKeys.j:
            return 'j';
          case KeyboardKeys.k:
            return 'k';
          case KeyboardKeys.l:
            return 'l';
          case KeyboardKeys.enter:
            return 'Enter';
          case KeyboardKeys.z:
            return 'z';
          case KeyboardKeys.x:
            return 'x';
          case KeyboardKeys.c:
            return 'c';
          case KeyboardKeys.v:
            return 'v';
          case KeyboardKeys.b:
            return 'b';
          case KeyboardKeys.n:
            return 'n';
          case KeyboardKeys.m:
            return 'm';
          case KeyboardKeys.a1:
          case KeyboardKeys.a2:
          case KeyboardKeys.b1:
          case KeyboardKeys.b2:
          case KeyboardKeys.c1:
          case KeyboardKeys.c2:
          case KeyboardKeys.delete:
            break;
        }
    }
    return null;
  }
}
