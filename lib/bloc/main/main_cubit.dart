import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void setLetter(final KeyboardKeys keyboardKey) {
    emit(GridUpdateState());
  }

  void removeLetter() {
    emit(GridUpdateState());
  }

  void updateKey(final KeyboardKeys key, final LetterStatus letterStatus) {
    emit(KeyboardKeyUpdateState(key, letterStatus));
  }

  void clearArea() {
    // reset data and create new secret word
    emit(MainInitial());
  }
}
