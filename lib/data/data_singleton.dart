import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/enums/keyboard_keys.dart';
import 'package:wordle/data/enums/message_types.dart';

class DataSingleton {
  factory DataSingleton() {
    return _dataSingleton;
  }

  DataSingleton._internal() {
    if (secretWord.isEmpty) {
      createWord();
    }
  }

  static final DataSingleton _dataSingleton = DataSingleton._internal();

  Set<String> allWords = {};
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
        // allWords = allWords.map((element) => element.substring(0, 4)).toSet();
        if (allWords.contains(gridData[currentWordIndex])) {
          nextWord();
          return GridUpdateState();
        } else {
          return SnackBarMessage(
            MessageTypes.error,
            "Word not found in dictionary",
          );
        }
      } else {
        return SnackBarMessage(
          MessageTypes.error,
          "Word not correct length",
        );
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
    final words = await _loadAsset().then((value) => value.split("\n"));
    final now = DateTime.now();
    final random = Random(now.year * 10000 + now.month * 100 + now.day);
    final index = random.nextInt(words.length);
    secretWord = words[index];
    allWords = words.toSet();
    return secretWord;
  }

  Future<String> _loadAsset() async {
    return rootBundle.loadString('assets/dictionary.txt');
  }

  String getLetters() {
    return gridData.join();
  }

  Color getKeyColor(KeyboardKeys myKey) {
    return coloredLetters[myKey.name] ?? Colors.black26;
  }

  void resetData() {
    allWords = {};
    secretWord = "";
    gridData = [""];
    coloredLetters = {};
    currentWordIndex = 0;
  }
}
