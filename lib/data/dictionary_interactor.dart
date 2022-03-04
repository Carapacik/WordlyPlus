import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/enums/keyboard_keys.dart';
import 'package:wordle/data/enums/flushbar_types.dart';
import 'package:wordle/resources/dictionary.dart';

class DictionaryInteractor {
  factory DictionaryInteractor.getInstance() =>
      _instance ??= DictionaryInteractor._internal();

  DictionaryInteractor._internal();

  static DictionaryInteractor? _instance;

  String secretWord = "";
  List<String> gridData = [""];
  Map<String, Color> coloredLetters = {};
  int currentWordIndex = 0;

  bool setLetter(KeyboardKeys key) {
    if (KeyboardKeys.enter.name == key.name) {
      return false;
    }
    if (gridData.length <= currentWordIndex) {
      gridData.add("");
    }
    if (gridData[currentWordIndex].length < 5) {
      gridData[currentWordIndex] = gridData[currentWordIndex] + key.name;
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
        if (allWords.contains(gridData[currentWordIndex])) {
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
        //green
        if (coloredLetters.containsKey(value)) {
          coloredLetters.update(value, (value) => Colors.green);
        } else {
          coloredLetters.addAll({value: Colors.green});
        }
      } else if (secretWord.contains(value)) {
        //orange
        if (coloredLetters.containsKey(value)) {
          if (coloredLetters[key] == Colors.black38) {
            coloredLetters.update(value, (value) => Colors.orangeAccent);
          }
        } else {
          coloredLetters.addAll({value: Colors.orangeAccent});
        }
      } else {
        //grey
        if (!coloredLetters.containsKey(value)) {
          coloredLetters.addAll({value: Colors.black38});
        }
      }
      return MapEntry(key, value);
    });
    if (currentWordIndex < 5) {
      currentWordIndex++;
    }
  }

  Future<String> createWord() async {
    final now = DateTime.now();
    final random = Random(now.year * 10000 + now.month * 100 + now.day);
    final index = random.nextInt(allWords.length);
    return secretWord = allWords[index];
  }

  String getLetters() {
    return gridData.join();
  }

  Color getKeyColor(KeyboardKeys myKey) {
    return coloredLetters[myKey.name] ?? Colors.black26;
  }

  void resetData() {
    secretWord = "";
    gridData = [""];
    coloredLetters = {};
    currentWordIndex = 0;
  }
}
