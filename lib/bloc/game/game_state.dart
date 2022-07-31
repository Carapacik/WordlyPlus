part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = _InitialGameState;

  const factory GameState.win() = _WinState;

  const factory GameState.lose() = _LoseState;

  const factory GameState.boardUpdate(List<LetterInfo> board) =
      _BoardUpdateGameState;

  const factory GameState.wordSubmit(List<LetterInfo> board) =
      _BoardUpdateGameState;

  const factory GameState.error(GameError error) = _ErrorGameState;
}
