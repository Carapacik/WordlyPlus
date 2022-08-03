import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models.dart';

void onKeyTap(BuildContext context, RawKeyDownEvent event) {
  final gameBloc = context.read<GameBloc>();
  if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
    gameBloc.add(const GameEvent.enterPressed());
    return;
  }

  if (event.isKeyPressed(LogicalKeyboardKey.delete) ||
      event.isKeyPressed(LogicalKeyboardKey.backspace)) {
    gameBloc.add(const GameEvent.deletePressed());
    return;
  }

  final letter = KeyboardKeys.fromLogicalKey(event.logicalKey);
  if (letter != null) {
    gameBloc.add(GameEvent.letterPressed(letter));
    return;
  }
}
