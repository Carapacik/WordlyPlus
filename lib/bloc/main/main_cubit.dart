import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordle/data/dictionary_interactor.dart';
import 'package:wordle/data/enums/keyboard_keys.dart';
import 'package:wordle/data/enums/letter.dart';
import 'package:wordle/data/enums/flushbar_types.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  DictionaryInteractor dictionary = DictionaryInteractor.getInstance();

  void setLetter(KeyboardKeys key) {
    if (dictionary.setLetter(key)) {
      emit(GridUpdateState());
    }
  }

  void removeLetter() {
    dictionary.removeLetter();
    emit(GridUpdateState());
  }

  bool submitWord() {
    final state = dictionary.submitWord();
    if (state is GridUpdateState ||
        state is WinGameState ||
        state is LoseGameState) {
      emit(state);
      if (state is WinGameState) {
        emit(GridUpdateState());
      }
      return true;
    } else if (state is TopMessageState) {
      emit(state);
      return false;
    }
    return false;
  }

  void updateKey(KeyboardKeys key, Letter letterType) {
    emit(KeyboardKeyUpdateState(key, letterType));
  }

  Future<void> clearGameArea() async {
    dictionary.resetData();
    await dictionary.createWord();
    emit(MainInitial());
  }
}
