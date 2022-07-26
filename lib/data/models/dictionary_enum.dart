import 'package:wordly/resources/dictionary_en.dart';
import 'package:wordly/resources/dictionary_ru.dart';

enum DictionaryEnum {
  ru._(2 / 3.4, dictionaryRu),
  en._(2 / 2.7, dictionaryEn);

  const DictionaryEnum._(this.aspectRatio, this.currentDictionary);

  final double aspectRatio;
  final Map<String, String> currentDictionary;
}
