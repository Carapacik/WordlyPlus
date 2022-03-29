import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'letter_entering.g.dart';

@Collection()
class LetterEntering {
  @Id()
  int? id;

  @Index()
  @DictionaryLanguagesConverter()
  late DictionaryLanguages language;

  late String letter;
  late LetterStatus letterStatus;
}
