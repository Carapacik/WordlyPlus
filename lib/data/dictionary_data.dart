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

  String? _secretWord;
  List<String> gridData = [""];
  Map<String, LetterStatus> _lettersMap = {};
  int currentWordIndex = 0;

  String get secretWord => _secretWord ?? "";

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
        if (gridData[currentWordIndex] == _secretWord) {
          checkWord();
          return WinGameState();
        }
        if (allWordsEn.contains(gridData[currentWordIndex])) {
          checkWord();
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

  void checkWord() {
    final word = gridData[currentWordIndex];
    if (_secretWord == null) return;
    word.split("").asMap().map((key, value) {
      if (_secretWord![key] == value) {
        // LetterStatus.correctSpot
        if (_lettersMap.containsKey(value)) {
          _lettersMap.update(value, (value) => LetterStatus.correctSpot);
        } else {
          _lettersMap.addAll({value: LetterStatus.correctSpot});
        }
      } else if (_secretWord!.contains(value)) {
        // LetterStatus.wrongSpot
        if (_lettersMap.containsKey(value)) {
          if (_lettersMap[key] == LetterStatus.notInWords) {
            _lettersMap.update(value, (value) => LetterStatus.wrongSpot);
          }
        } else {
          _lettersMap.addAll({value: LetterStatus.wrongSpot});
        }
      } else {
        // LetterStatus.notInWords
        if (!_lettersMap.containsKey(value)) {
          _lettersMap.addAll({value: LetterStatus.notInWords});
        }
      }
      return MapEntry(key, value);
    });
    if (currentWordIndex < 5) {
      currentWordIndex++;
    }
  }

  Future<String> createSecretWord() async {
    final now = DateTime.now();
    late Random random;
    random = Random(now.year * 10000 + now.month * 100 + now.day);
    final index = random.nextInt(allWordsEn.length);
    return _secretWord = allWordsEn[index];
  }

  List<String> getAllLettersInList() {
    return gridData[currentWordIndex - 1].split("");
  }

  String getAllLettersInString() {
    return gridData.join();
  }

  LetterStatus getKeyStatus(KeyboardKeys keyboardKeys) {
    return _lettersMap[keyboardKeys.name()] ?? LetterStatus.unknown;
  }

  void resetData() {
    _secretWord = null;
    gridData = [""];
    _lettersMap = {};
    currentWordIndex = 0;
  }
}
