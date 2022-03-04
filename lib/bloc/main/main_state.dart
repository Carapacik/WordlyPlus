part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class GridUpdateState extends MainState {
  final id = DateTime.now().microsecondsSinceEpoch;

  @override
  List<Object> get props => [id];
}

class KeyboardKeyUpdateState extends MainState {
  KeyboardKeyUpdateState(this.key, this.letterType);

  final id = DateTime.now().microsecondsSinceEpoch;
  final KeyboardKeys key;
  final Letter letterType;

  @override
  List<Object> get props => [id, key, letterType];
}

class SnackBarMessage extends MainState {
  SnackBarMessage(this.type, this.message);

  final id = DateTime.now().microsecondsSinceEpoch;
  final MessageTypes type;
  final String message;

  @override
  List<Object> get props => [id, type, message];
}

class LoseGameState extends MainState {
  @override
  List<Object> get props => [];
}

class WinGameState extends MainState {
  @override
  List<Object> get props => [];
}
