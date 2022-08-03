part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = _InitialState;

  const factory GameState.complete(GameResult result) = _CompleteGameState;

  const factory GameState.error(GameError error) = _ErrorState;

  const factory GameState.boardUpdate(List<LetterInfo> board) =
      _BoardUpdateState;

  const factory GameState.wordSubmit({
    required List<LetterInfo> board,
    required String keyboard,
  }) = _WordSumbitState;

  bool get isUpdate => this is _BoardUpdateState || this is _WordSumbitState;

  bool get isGameComplete => this is _CompleteGameState;
}
