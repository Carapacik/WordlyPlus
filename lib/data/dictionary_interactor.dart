import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/entities/flushbar_types.dart';
import 'package:wordle/data/entities/keyboard_keys.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/dictionary_en.dart';

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
        //green
        if (coloredLetters.containsKey(value)) {
          coloredLetters.update(value, (value) => Colors.green);
        } else {
          coloredLetters.addAll({value: Colors.green});
        }
      } else if (secretWord.contains(value)) {
        //orange
        if (coloredLetters.containsKey(value)) {
          if (coloredLetters[key] == AppColors.greyMainDark) {
            coloredLetters.update(value, (value) => Colors.orangeAccent);
          }
        } else {
          coloredLetters.addAll({value: Colors.orangeAccent});
        }
      } else {
        //grey
        if (!coloredLetters.containsKey(value)) {
          coloredLetters.addAll({value: AppColors.greyMainDark});
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

  Color getKeyColor(KeyboardKeys keyboardKeys) {
    return coloredLetters[keyboardKeys.name()] ?? AppColors.greyMain;
  }

  void resetData() {
    secretWord = "";
    gridData = [""];
    coloredLetters = {};
    currentWordIndex = 0;
  }
}
