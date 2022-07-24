part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = _InitialGameState;

  const factory GameState.boardUpdate({required String board}) =
      _BoardUpdateGameState;

  const factory GameState.error({required String errorMessage}) =
      _ErrorGameState;
}
