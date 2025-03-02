part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GameEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent()';
  }
}

/// @nodoc

class _GameChangeDictionary implements GameEvent {
  const _GameChangeDictionary(this.dictionary);

  final Locale dictionary;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameChangeDictionary &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dictionary);

  @override
  String toString() {
    return 'GameEvent.changeDictionary(dictionary: $dictionary)';
  }
}

/// @nodoc

class _GameChangeGameMode implements GameEvent {
  const _GameChangeGameMode(this.gameMode);

  final GameMode gameMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameChangeGameMode &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @override
  String toString() {
    return 'GameEvent.changeGameMode(gameMode: $gameMode)';
  }
}

/// @nodoc

class _GameResetBoard implements GameEvent {
  const _GameResetBoard(this.gameMode);

  final GameMode gameMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameResetBoard &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @override
  String toString() {
    return 'GameEvent.resetBoard(gameMode: $gameMode)';
  }
}

/// @nodoc

class _GameLetterPressed implements GameEvent {
  const _GameLetterPressed(this.key);

  final String key;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameLetterPressed &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @override
  String toString() {
    return 'GameEvent.letterPressed(key: $key)';
  }
}

/// @nodoc

class _GameDeletePressed implements GameEvent {
  const _GameDeletePressed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _GameDeletePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.deletePressed()';
  }
}

/// @nodoc

class _GameDeleteLongPressed implements GameEvent {
  const _GameDeleteLongPressed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _GameDeleteLongPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.deleteLongPressed()';
  }
}

/// @nodoc

class _GameEnterPressed implements GameEvent {
  const _GameEnterPressed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _GameEnterPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.enterPressed()';
  }
}

/// @nodoc

class _GameListenKeyEvent implements GameEvent {
  const _GameListenKeyEvent(this.keyEvent);

  final KeyEvent keyEvent;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameListenKeyEvent &&
            (identical(other.keyEvent, keyEvent) || other.keyEvent == keyEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyEvent);

  @override
  String toString() {
    return 'GameEvent.listenKeyEvent(keyEvent: $keyEvent)';
  }
}

/// @nodoc
mixin _$GameState {
  Locale get dictionary;

  String get secretWord;

  GameMode get gameMode;

  bool get gameCompleted;

  List<LetterInfo> get board;

  Map<String, LetterStatus> get statuses;

  int? get lvlNumber;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameState &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other.board, board) &&
            const DeepCollectionEquality().equals(other.statuses, statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(board),
    const DeepCollectionEquality().hash(statuses),
    lvlNumber,
  );

  @override
  String toString() {
    return 'GameState(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }
}

/// @nodoc

class GameIdle extends GameState {
  const GameIdle({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
       _statuses = statuses,
       super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameIdle &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

  @override
  String toString() {
    return 'GameState.idle(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }
}

/// @nodoc

class GameLoss extends GameState {
  const GameLoss({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
       _statuses = statuses,
       super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameLoss &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

  @override
  String toString() {
    return 'GameState.loss(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }
}

/// @nodoc

class GameWin extends GameState {
  const GameWin({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.lvlNumber,
  }) : _board = board,
       _statuses = statuses,
       super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  @override
  final int? lvlNumber;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameWin &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    lvlNumber,
  );

  @override
  String toString() {
    return 'GameState.win(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, lvlNumber: $lvlNumber)';
  }
}

/// @nodoc

class GameFailure extends GameState {
  const GameFailure({
    required this.dictionary,
    required this.secretWord,
    required this.gameMode,
    required this.gameCompleted,
    required final List<LetterInfo> board,
    required final Map<String, LetterStatus> statuses,
    required this.error,
    required this.lvlNumber,
  }) : _board = board,
       _statuses = statuses,
       super._();

  @override
  final Locale dictionary;
  @override
  final String secretWord;
  @override
  final GameMode gameMode;
  @override
  final bool gameCompleted;
  final List<LetterInfo> _board;

  @override
  List<LetterInfo> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  final Map<String, LetterStatus> _statuses;

  @override
  Map<String, LetterStatus> get statuses {
    if (_statuses is EqualUnmodifiableMapView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statuses);
  }

  final WordError error;
  @override
  final int? lvlNumber;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameFailure &&
            (identical(other.dictionary, dictionary) || other.dictionary == dictionary) &&
            (identical(other.secretWord, secretWord) || other.secretWord == secretWord) &&
            (identical(other.gameMode, gameMode) || other.gameMode == gameMode) &&
            (identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lvlNumber, lvlNumber) || other.lvlNumber == lvlNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dictionary,
    secretWord,
    gameMode,
    gameCompleted,
    const DeepCollectionEquality().hash(_board),
    const DeepCollectionEquality().hash(_statuses),
    error,
    lvlNumber,
  );

  @override
  String toString() {
    return 'GameState.failure(dictionary: $dictionary, secretWord: $secretWord, gameMode: $gameMode, gameCompleted: $gameCompleted, board: $board, statuses: $statuses, error: $error, lvlNumber: $lvlNumber)';
  }
}
