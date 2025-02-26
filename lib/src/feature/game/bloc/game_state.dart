part of 'game_bloc.dart';

@Freezed()
sealed class GameState with _$GameState {
  const GameState._();

  const factory GameState.idle({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = GameIdle;

  const factory GameState.loss({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = GameLoss;

  const factory GameState.win({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required int? lvlNumber,
  }) = GameWin;

  const factory GameState.failure({
    required Locale dictionary,
    required String secretWord,
    required GameMode gameMode,
    required bool gameCompleted,
    required List<LetterInfo> board,
    required Map<String, LetterStatus> statuses,
    required WordError error,
    required int? lvlNumber,
  }) = GameFailure;

  int get currentWordIndex => (board.length - 1) ~/ 5;

  bool get isResult => this is GameWin || this is GameLoss;

  bool get isWin => this is GameWin;

  bool get isFailure => this is GameFailure;

  (bool, int, List<LetterInfo>)? get buildResultString {
    final result = switch (this) {
      final GameWin _ => true,
      final GameLoss _ => true,
      _ => null,
    };
    if (result == null) {
      return null;
    }
    return (result, currentWordIndex + 1, board);
  }
}
