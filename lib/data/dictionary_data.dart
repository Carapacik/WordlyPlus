import 'dart:math';

import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_status.dart';
import 'package:wordle/resources/dictionary_en.dart';

class DictionaryData {
  factory DictionaryData.getInstance() =>
      _instance ??= DictionaryData._internal();

  DictionaryData._internal();

  static DictionaryData? _instance;

  String secretWord = "";
  List<String> gridData = [""];
  Map<String, LetterStatus> lettersMap = {};
  int currentWordIndex = 0;

  bool setLetter(KeyboardKeys key) {
    if (KeyboardKeys.enter.name == key.name) {
      return false;
    }

    if (gridData.length <= currentWordIndex) {
      gridData.add("");
    }
    if (gridData[currentWordIndex].length < 5) {
      gridData[currentWordIndex] =
          gridData[currentWordIndex] + (key.name() ?? "");
      return true;
    }
    return false;
  }

  void removeLetter() {
    if (gridData.length <= currentWordIndex) {
      gridData.add("");
    }
    final int wordLength = gridData[currentWordIndex].length;
    if (wordLength > 0) {
      gridData[currentWordIndex] =
          gridData[currentWordIndex].substring(0, wordLength - 1);
    }
  }

  MainState submitWord() {
    if (gridData.length <= currentWordIndex) {
      gridData.add("");
    }
    if (currentWordIndex < 5) {
      if (gridData[currentWordIndex].length == 5) {
        if (gridData[currentWordIndex] == secretWord) {
          nextWord();
          return WinGameState();
        }
        if (allWordsEn.contains(gridData[currentWordIndex])) {
          nextWord();
          return GridUpdateState();
        } else {
          return TopMessageState(FlushBarTypes.notFound);
        }
      } else {
        return TopMessageState(FlushBarTypes.notCorrectLength);
      }
    } else {
      return LoseGameState();
    }
  }

  void nextWord() {
    final word = gridData[currentWordIndex];
    word.split("").asMap().map((key, value) {
      if (secretWord[key] == value) {
        // LetterStatus.correctSpot
        if (lettersMap.containsKey(value)) {
          lettersMap.update(value, (value) => LetterStatus.correctSpot);
        } else {
          lettersMap.addAll({value: LetterStatus.correctSpot});
        }
      } else if (secretWord.contains(value)) {
        // LetterStatus.wrongSpot
        if (lettersMap.containsKey(value)) {
          if (lettersMap[key] == LetterStatus.notInWords) {
            lettersMap.update(value, (value) => LetterStatus.wrongSpot);
          }
        } else {
          lettersMap.addAll({value: LetterStatus.wrongSpot});
        }
      } else {
        // LetterStatus.notInWords
        if (!lettersMap.containsKey(value)) {
          lettersMap.addAll({value: LetterStatus.notInWords});
        }
      }
      return MapEntry(key, value);
    });
    if (currentWordIndex < 5) {
      currentWordIndex++;
    }
  }

  Future<String> createWord({final int? level}) async {
    final now = DateTime.now();
    late Random random;
    if (level == null) {
      random = Random(now.year * 10000 + now.month * 100 + now.day);
    } else {
      random = Random(level);
    }
    final index = random.nextInt(allWordsEn.length);
    return secretWord = allWordsEn[index];
  }

  String getLetters() {
    return gridData.join();
  }

  LetterStatus getKeyStatus(KeyboardKeys keyboardKeys) {
    return lettersMap[keyboardKeys.name()] ?? LetterStatus.unknown;
  }

  void resetData() {
    secretWord = "";
    gridData = [""];
    lettersMap = {};
    currentWordIndex = 0;
  }
}
