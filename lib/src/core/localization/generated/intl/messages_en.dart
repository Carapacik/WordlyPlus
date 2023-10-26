// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(number) => "Level ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Wordly Plus"),
        "currentStreak":
            MessageLookupByLibrary.simpleMessage("Current\nStreak"),
        "daily": MessageLookupByLibrary.simpleMessage("Daily"),
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "guessDistribution":
            MessageLookupByLibrary.simpleMessage("Guess distribution"),
        "levelNumber": m0,
        "levels": MessageLookupByLibrary.simpleMessage("Levels"),
        "loseMessage": MessageLookupByLibrary.simpleMessage("You lost"),
        "maxStreak": MessageLookupByLibrary.simpleMessage("Max\nStreak"),
        "message_new_word": MessageLookupByLibrary.simpleMessage(
            "subject=Wordle%20-%20New%20word&body=Word%20-%0AMeaning%20-"),
        "nextLevel": MessageLookupByLibrary.simpleMessage("Next level"),
        "nextWord": MessageLookupByLibrary.simpleMessage("Next wordle in"),
        "notPlayed": MessageLookupByLibrary.simpleMessage(
            "You haven\'t played a single game"),
        "played": MessageLookupByLibrary.simpleMessage("Played"),
        "ru": MessageLookupByLibrary.simpleMessage("Russian"),
        "secretWord": MessageLookupByLibrary.simpleMessage("Secret word"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "start": MessageLookupByLibrary.simpleMessage("Start game"),
        "statistic": MessageLookupByLibrary.simpleMessage("Statistic"),
        "tutorial": MessageLookupByLibrary.simpleMessage("How to play"),
        "viewLevels": MessageLookupByLibrary.simpleMessage("View levels"),
        "viewStatistic": MessageLookupByLibrary.simpleMessage("View statistic"),
        "winMessage": MessageLookupByLibrary.simpleMessage("You win!"),
        "winRate": MessageLookupByLibrary.simpleMessage("Win\nrate"),
        "wordNotFound": MessageLookupByLibrary.simpleMessage(
            "Word not found in dictionary"),
        "wordTooShort":
            MessageLookupByLibrary.simpleMessage("Word is not correct length")
      };
}
