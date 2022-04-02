import 'dart:math';

import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/data/collections/board_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/domain/board_repository.dart';
import 'package:wordly/domain/level_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  late DictionaryLanguages _dictionaryLanguage;
  int _currentWordIndex = 0;
  bool _completeGame = false;
  String? _secretWord;
  Map<String, LetterStatus> _keyboardState = {};
  List<String> _gridData = [""];
  List<LetterEntering> _emojiList = [];

  @override
  String get secretWord => _secretWord ?? "";

  @override
  String get secretWordMeaning =>
      _dictionaryLanguage.getCurrentDictionary()[_secretWord] ?? "";

  @override
  int get currentAttempt => _currentWordIndex;

  @override
  set dictionaryLanguage(DictionaryLanguages dictionaryLanguage) =>
      _dictionaryLanguage = dictionaryLanguage;

  @override
  MainState? completeWord() {
    if (_completeGame) {
      return null;
    }
    if (_gridData.length <= _currentWordIndex) {
      _gridData.add("");
    }
    if (_currentWordIndex < 6) {
      if (_gridData[_currentWordIndex].length == 5) {
        if (_gridData[_currentWordIndex] == _secretWord) {
          _checkWord();
          _completeGame = true;
          return WinGameState();
        } else if (_currentWordIndex == 5) {
          _checkWord();
          _completeGame = true;
          return LoseGameState();
        }
        if (_dictionaryLanguage
            .getCurrentDictionary()
            .containsKey(_gridData[_currentWordIndex])) {
          _checkWord();
          return GridUpdateState();
        }
        return TopMessageState(FlushBarTypes.notFound);
      }
      return TopMessageState(FlushBarTypes.notCorrectLength);
    }
    return null;
  }

  void _checkWord() {
    final word = _gridData[_currentWordIndex];
    if (_secretWord == null) return;
    word.split("").asMap().map((key, value) {
      var _status = LetterStatus.unknown;
      if (_secretWord![key] == value) {
        // LetterStatus.correctSpot
        if (_keyboardState.containsKey(value)) {
          _keyboardState.update(value, (value) => LetterStatus.correctSpot);
        } else {
          _keyboardState.addAll({value: LetterStatus.correctSpot});
        }
        _status = LetterStatus.correctSpot;
      } else if (_secretWord!.contains(value)) {
        // LetterStatus.wrongSpot
        if (_keyboardState.containsKey(value)) {
          if (_keyboardState[key] == LetterStatus.notInWords) {
            _keyboardState.update(value, (value) => LetterStatus.wrongSpot);
          }
        } else {
          _keyboardState.addAll({value: LetterStatus.wrongSpot});
        }
        _status = LetterStatus.wrongSpot;
      } else {
        // LetterStatus.notInWords
        if (!_keyboardState.containsKey(value)) {
          _keyboardState.addAll({value: LetterStatus.notInWords});
        }
        _status = LetterStatus.notInWords;
      }
      _emojiList.add(
        LetterEntering(letter: value, letterStatus: _status),
      );

      return MapEntry(key, value);
    });
    if (_currentWordIndex < 6) {
      _currentWordIndex++;
    }
  }

  @override
  String createSecretWord([int level = 0]) {
    final dictionary = _dictionaryLanguage.getCurrentDictionary();
    late int index;
    if (level == 0) {
      final now = DateTime.now();
      final Random random =
          Random(now.year * 10000 + now.month * 100 + now.day);
      index = random.nextInt(dictionary.length);
    } else {
      index = Random(level).nextInt(dictionary.length);
    }
    return _secretWord = dictionary.keys.elementAt(index);
  }

  @override
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
          _gridData[_currentWordIndex] + (key.name(_dictionaryLanguage) ?? "");
      return true;
    }
    return false;
  }

  @override
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

  @override
  void removeFullWord() {
    if (_gridData.length <= _currentWordIndex) {
      _gridData.add("");
    }
    final int wordLength = _gridData[_currentWordIndex].length;
    if (wordLength > 0) {
      _gridData[_currentWordIndex] = "";
    }
  }

  @override
  LetterEntering getLetterStatusByIndex(final int index) {
    final currentLetters = _gridData.join();
    final letter = currentLetters.length > index ? currentLetters[index] : "";
    LetterStatus letterStatus = LetterStatus.unknown;
    if (letter.isNotEmpty &&
        _currentWordIndex > 0 &&
        index < 5 * _currentWordIndex) {
      final indexInRow = index % 5;
      if (currentLetters.contains(letter)) {
        letterStatus = LetterStatus.notInWords;
      }
      if (_secretWord?.contains(letter) ?? false) {
        letterStatus = LetterStatus.wrongSpot;
      }
      if (_secretWord?[indexInRow] == letter) {
        letterStatus = LetterStatus.correctSpot;
      }
    }
    return LetterEntering(letter: letter, letterStatus: letterStatus);
  }

  @override
  LetterStatus getKeyStatus(String? keyName) {
    return _keyboardState[keyName] ?? LetterStatus.unknown;
  }

  @override
  Map<int, String> getAllLettersInList() {
    return _gridData[_currentWordIndex - 1].split("").asMap();
  }

  @override
  void loadBoard() {
    final boardData = GetIt.I<BoardRepository>().boardData;
    if (boardData.id != null && boardData.secretWord == _secretWord) {
      _keyboardState = boardData.toMap();
      _completeGame = boardData.isComplete;
      _currentWordIndex = boardData.lettersState.length;
      _gridData = boardData.lettersState;
      _keyboardState = boardData.toMap();
      _emojiList = boardData.lettersState
          .join()
          .split("")
          .mapIndexed((index, element) => getLetterStatusByIndex(index))
          .toList();
    }
  }

  @override
  void saveBoard() {
    final levelRepository = GetIt.I<LevelRepository>();
    final boardData = BoardData()
      ..language = _dictionaryLanguage
      ..levelNumber =
          levelRepository.isLevelMode ? levelRepository.levelData.lastLevel : 0
      ..secretWord = _secretWord ?? ""
      ..isComplete = _completeGame
      ..keyboardLetters = BoardData.toListString(_keyboardState)
      ..keyboardLetterStatuses = BoardData.toListLetterStatus(_keyboardState)
      ..lettersState = _gridData;
    final boardRepository = GetIt.I<BoardRepository>();
    boardRepository.saveBoardData(boardData);
  }

  @override
  String get getEmojiString {
    String emojiString = "";
    _emojiList.asMap().map((key, value) {
      emojiString += value.letterStatus.toEmoji();
      if (key % 5 == 4) {
        emojiString += "\n";
      }
      return MapEntry(key, value);
    });
    return emojiString;
  }

  @override
  void resetData() {
    _secretWord = null;
    _completeGame = false;
    _gridData = [""];
    _keyboardState = {};
    _currentWordIndex = 0;
    _emojiList.clear();
  }
}
