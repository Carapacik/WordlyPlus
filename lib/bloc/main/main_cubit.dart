import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_status.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const ChangeDictionaryState("en"));

  DictionaryData dictionary = DictionaryData.getInstance();

  void changeDictionary({required String value}) {
    DictionaryData.getInstance().setDictionaryLanguage(value);
    emit(ChangeDictionaryState(value));
  }

  void setLetter(final KeyboardKeys keyboardKey) {
    if (dictionary.setLetter(keyboardKey)) {
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

  void updateKey(KeyboardKeys key, LetterStatus letterType) {
    emit(KeyboardKeyUpdateState(key, letterType));
  }

  Future<void> clearGameArea(final String lang) async {
    dictionary.resetData();
    await dictionary.createSecretWord();
    emit(ChangeDictionaryState(lang));
  }
}
