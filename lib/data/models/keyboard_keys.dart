import 'package:wordly/data/models/dictionary_languages.dart';

enum KeyboardKeys {
  q,
  w,
  e,
  r,
  t,
  y,
  u,
  i,
  o,
  p,
  a1, // х
  a2, // ъ
  a,
  s,
  d,
  f,
  g,
  h,
  j,
  k,
  l,
  b1, // ж
  b2, // э
  enter,
  z,
  x,
  c,
  v,
  b,
  n,
  m,
  c1, // б
  c2, // ю
  delete,
}

const _defaultWidthRu = 0.067;
const _defaultWidthEn = 0.08;

extension KeyboardKeyExtension on KeyboardKeys {
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
