// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(number) => "Уровень ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("О приложении"),
        "appDictionary": MessageLookupByLibrary.simpleMessage("Язык словаря"),
        "appLanguage": MessageLookupByLibrary.simpleMessage("Язык приложения"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Словень Плюс"),
        "casual": MessageLookupByLibrary.simpleMessage("Обычный"),
        "colorMode": MessageLookupByLibrary.simpleMessage("Цветовой режим"),
        "currentStreak": MessageLookupByLibrary.simpleMessage("Текущая\nСерия"),
        "daily": MessageLookupByLibrary.simpleMessage("Ежедневный"),
        "en": MessageLookupByLibrary.simpleMessage("Английский"),
        "guessDistribution":
            MessageLookupByLibrary.simpleMessage("Распределение догадок"),
        "highContrast":
            MessageLookupByLibrary.simpleMessage("Высокий контраст"),
        "levelNumber": m0,
        "levels": MessageLookupByLibrary.simpleMessage("Уровни"),
        "loseMessage": MessageLookupByLibrary.simpleMessage("Вы проиграли"),
        "maxStreak": MessageLookupByLibrary.simpleMessage("Макс.\nСерия"),
        "message_new_word": MessageLookupByLibrary.simpleMessage(
            "subject=Словень%20-%20Новое%20слово&body=Слово%20-%0AЗначение%20-"),
        "nextLevel": MessageLookupByLibrary.simpleMessage("Следующий уровень"),
        "nextWord":
            MessageLookupByLibrary.simpleMessage("Следующее слово через"),
        "notPlayed":
            MessageLookupByLibrary.simpleMessage("Вы не сыграли ни одной игры"),
        "other": MessageLookupByLibrary.simpleMessage("Другой"),
        "played": MessageLookupByLibrary.simpleMessage("Сыграно"),
        "ru": MessageLookupByLibrary.simpleMessage("Русский"),
        "secretWord": MessageLookupByLibrary.simpleMessage("Загаданное слово"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "start": MessageLookupByLibrary.simpleMessage("Начать играть"),
        "statistic": MessageLookupByLibrary.simpleMessage("Статистика"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Темная"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Светлая"),
        "themeMode": MessageLookupByLibrary.simpleMessage("Тема"),
        "themeSystem": MessageLookupByLibrary.simpleMessage("Системная"),
        "tutorial": MessageLookupByLibrary.simpleMessage("Как играть"),
        "viewLevels": MessageLookupByLibrary.simpleMessage("Посмотреть уровни"),
        "viewStatistic":
            MessageLookupByLibrary.simpleMessage("Посмотреть статистику"),
        "winMessage": MessageLookupByLibrary.simpleMessage("Вы победили!"),
        "winRate": MessageLookupByLibrary.simpleMessage("Показатель\nпобед"),
        "wordNotFound":
            MessageLookupByLibrary.simpleMessage("Слово не найдено в словаре"),
        "wordTooShort":
            MessageLookupByLibrary.simpleMessage("Слово неправильной длины")
      };
}
