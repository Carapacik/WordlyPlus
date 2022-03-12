import 'dart:math';

import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_data.dart';
import 'package:wordle/data/models/letter_status.dart';
import 'package:wordle/resources/dictionary_en.dart';
import 'package:wordle/resources/dictionary_ru.dart';

class DictionaryData {
  factory DictionaryData.getInstance() =>
      _instance ??= DictionaryData._internal();

  DictionaryData._internal();

  static DictionaryData? _instance;

  String _dictionaryLanguage = "en";
  String? _secretWord;
  List<String> _gridData = [""];
  Map<String, LetterStatus> _lettersMap = {};
  int currentWordIndex = 0;
  final List<LetterData> _letterDataList = [];

  String get secretWord => _secretWord ?? "";

  //ignore: use_setters_to_change_properties
  void setDictionaryLanguage(final String value) {
    _dictionaryLanguage = value;
  }

  List<LetterData> get letterDataList => _letterDataList;

  bool setLetter(final KeyboardKeys key) {
    if (KeyboardKeys.enter.name == key.name) {
      return false;
    }

    if (_gridData.length <= currentWordIndex) {
      _gridData.add("");
    }
    if (_gridData[currentWordIndex].length < 5) {
      _gridData[currentWordIndex] =
          _gridData[currentWordIndex] + (key.name(lang: _getIntLang()) ?? "");
      return true;
    }
    return false;
  }

  void removeLetter() {
    if (_gridData.length <= currentWordIndex) {
      _gridData.add("");
    }
    final int wordLength = _gridData[currentWordIndex].length;
    if (wordLength > 0) {
      _gridData[currentWordIndex] =
          _gridData[currentWordIndex].substring(0, wordLength - 1);
    }
  }

  MainState submitWord() {
    if (_gridData.length <= currentWordIndex) {
      _gridData.add("");
    }
    if (currentWordIndex < 5) {
      if (_gridData[currentWordIndex].length == 5) {
        if (_gridData[currentWordIndex] == _secretWord) {
          checkWord();
          return WinGameState();
        }
        if (_getCurrentAllWord().contains(_gridData[currentWordIndex])) {
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
    final word = _gridData[currentWordIndex];
    if (_secretWord == null) return;
    word.split("").asMap().map((key, value) {
      var _status = LetterStatus.unknown;
      if (_secretWord![key] == value) {
        // LetterStatus.correctSpot
        if (_lettersMap.containsKey(value)) {
          _lettersMap.update(value, (value) => LetterStatus.correctSpot);
        } else {
          _lettersMap.addAll({value: LetterStatus.correctSpot});
        }
        _status = LetterStatus.correctSpot;
      } else if (_secretWord!.contains(value)) {
        // LetterStatus.wrongSpot
        if (_lettersMap.containsKey(value)) {
          if (_lettersMap[key] == LetterStatus.notInWords) {
            _lettersMap.update(value, (value) => LetterStatus.wrongSpot);
          }
        } else {
          _lettersMap.addAll({value: LetterStatus.wrongSpot});
        }
        _status = LetterStatus.wrongSpot;
      } else {
        // LetterStatus.notInWords
        if (!_lettersMap.containsKey(value)) {
          _lettersMap.addAll({value: LetterStatus.notInWords});
        }
        _status = LetterStatus.notInWords;
      }
      _letterDataList.add(LetterData(letter: value, status: _status));
      return MapEntry(key, value);
    });
    if (currentWordIndex < 5) {
      currentWordIndex++;
    }
  }

  Future<String> createSecretWord() async {
    final now = DateTime.now();
    final Random random = Random(now.year * 10000 + now.month * 100 + now.day);
    final dictionary = _getCurrentAllWord();
    final index = random.nextInt(dictionary.length);
    return _secretWord = dictionary[index];
  }

  List<String> getAllLettersInList() {
    return _gridData[currentWordIndex - 1].split("");
  }

  String getAllLettersInString() {
    return _gridData.join();
  }

  LetterStatus getKeyStatus(String? keyName) {
    return _lettersMap[keyName] ?? LetterStatus.unknown;
  }

  List<String> _getCurrentAllWord() {
    switch (_dictionaryLanguage) {
      case "ru":
        return dictionaryRuFixed;
      case "en":
      default:
        return dictionaryEnFixed;
    }
  }

  int _getIntLang() {
    switch (_dictionaryLanguage) {
      case "ru":
        return 1;
      case "en":
      default:
        return 0;
    }
  }

  void resetData() {
    _secretWord = null;
    _gridData = [""];
    _lettersMap = {};
    currentWordIndex = 0;
  }
}
