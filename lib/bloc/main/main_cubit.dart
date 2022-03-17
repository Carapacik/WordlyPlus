import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/flushbar_types.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_status.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitDictionaryLangState());

  DictionaryData dictionary = DictionaryData.getInstance();

  Future<void> changeDictionary({required String value}) async {
    DictionaryData.getInstance().setDictionaryLanguage(value);
    final sp = await SharedPreferences.getInstance();
    sp.setString("dict_lang", value);
    print(value);
    emit(ChangeDictionaryState(value));
  }

  Future<void> getDictionary() async {
    final sp = await SharedPreferences.getInstance();
    var value = sp.getString("dict_lang");
    print('dict get - $value');
    value ??= "en";
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
    if (state == null) {
      return false;
    }
    if (state is GridUpdateState ||
        state is WinGameState ||
        state is LoseGameState) {
      emit(state);
      if (state is WinGameState || state is LoseGameState) {
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
