import 'dart:math';

import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/models/board_data.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_data.dart';
import 'package:wordle/data/models/letter_status.dart';
import 'package:wordle/resources/dictionary_en_fixed.dart';
import 'package:wordle/resources/dictionary_ru_fixed.dart';
import 'package:wordle/data/repositories/board_state_repository.dart';


class DictionaryData {
  factory DictionaryData.getInstance() =>
      _instance ??= DictionaryData._internal();

  DictionaryData._internal();

  static DictionaryData? _instance;

  String _dictionaryLanguage = "en";
  String? _secretWord;
  List<String> _gridData = [""];
  Map<String, LetterStatus> _lettersMap = {};
  int _currentWordIndex = 0;
  final List<LetterData> _letterDataList = [];
  bool _completeGame = false;

  String get secretWord => _secretWord ?? "";

  int get currentWordIndex => _currentWordIndex;

  List<LetterData> get letterDataList => _letterDataList;

  //ignore: use_setters_to_change_properties
  void setDictionaryLanguage(final String value) {
    _dictionaryLanguage = value;
  }

  bool setLetter(final KeyboardKeys key) {
    if (_completeGame) {
      return false;
    }
    if (KeyboardKeys.enter.name == key.name) {
      return false;
    }
    if (_gridData.length <= _currentWordIndex) {
      _gridData.add("");
    }
    if (_gridData[_currentWordIndex].length < 5) {
      _gridData[_currentWordIndex] =
          _gridData[_currentWordIndex] + (key.name(lang: _getIntLang()) ?? "");
      return true;
    }
    return false;
  }

  Future<String?> getBoard() async {
    var boardState = await BoardStateRepository.getInstance().getItem();
    if (boardState == null) {
      await BoardStateRepository.getInstance().setItem(BoardData());
      boardState = await BoardStateRepository.getInstance().getItem();
    }
    if (_dictionaryLanguage == 'en') {
      if (_secretWord == boardState?.enWord && boardState?.enBoard != null) {
        _gridData = boardState!.enBoard!;
        _currentWordIndex = boardState.enIndex;
        _lettersMap = boardState.enKeyboard ?? {};
        return _gridData.join();
      }
    } else {
      if (_secretWord == boardState?.ruWord && boardState?.ruBoard != null) {
        _gridData = boardState!.ruBoard!;
        _currentWordIndex = boardState.ruIndex;
        _lettersMap = boardState.ruKeyboard ?? {};
        return _gridData.join();
      }
    }
    return '';
  }

  Future<void> saveToPrefs() async {
    var boardState = await BoardStateRepository.getInstance().getItem();
    if (boardState == null) {
      await BoardStateRepository.getInstance().setItem(BoardData());
      boardState = await BoardStateRepository.getInstance().getItem();
    }
    BoardStateRepository.getInstance().setItem(
      _dictionaryLanguage == 'en'
          ? boardState!.copyWith(enBoard: _gridData, enWord: _secretWord)
          : boardState!.copyWith(ruWord: _secretWord, ruBoard: _gridData),
    );
    print(boardState);
  }

  Future<void> saveWordIndexToPrefs() async {
    var boardState = await BoardStateRepository.getInstance().getItem();
    if (boardState == null) {
      await BoardStateRepository.getInstance().setItem(BoardData());
      boardState = await BoardStateRepository.getInstance().getItem();
    }
    BoardStateRepository.getInstance().setItem(
      _dictionaryLanguage == 'en'
          ? boardState!
              .copyWith(enIndex: _currentWordIndex, enKeyboard: _lettersMap)
          : boardState!
              .copyWith(ruIndex: _currentWordIndex, ruKeyboard: _lettersMap),
    );
  }

  void removeLetter() {
    if (_gridData.length <= _currentWordIndex) {
      _gridData.add("");
    }
    final int wordLength = _gridData[_currentWordIndex].length;
    if (wordLength > 0) {
      _gridData[_currentWordIndex] =
          _gridData[_currentWordIndex].substring(0, wordLength - 1);
    }
  }

  MainState? submitWord() {
    if (_completeGame) {
      return null;
    }
    if (_gridData.length <= _currentWordIndex) {
      _gridData.add("");
    }
    if (_currentWordIndex < 6) {
      if (_gridData[_currentWordIndex].length == 5) {
        if (_gridData[_currentWordIndex] == _secretWord) {
          checkWord();
          _completeGame = true;
          return WinGameState();
        } else if (_currentWordIndex == 5) {
          checkWord();
          _completeGame = true;
          return LoseGameState();
        }
        if (_getCurrentAllWord().contains(_gridData[_currentWordIndex])) {
          checkWord();
          return GridUpdateState();
        }
        return TopMessageState(FlushBarTypes.notFound);
      }
      return TopMessageState(FlushBarTypes.notCorrectLength);
    }
    return null;
  }

  void checkWord() {
    final word = _gridData[_currentWordIndex];
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
    if (_currentWordIndex < 6) {
      _currentWordIndex++;
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
    return _gridData[_currentWordIndex - 1].split("");
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
        return dictionaryRu;
      case "en":
      default:
        return dictionaryEn;
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
    _completeGame = false;
    _gridData = [""];
    _lettersMap = {};
    _letterDataList.clear();
    _currentWordIndex = 0;
  }
}
