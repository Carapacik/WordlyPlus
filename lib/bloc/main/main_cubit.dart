import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/dictionary_repository.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  final dictionaryRepository = GetIt.I<DictionaryRepository>();

  void setLetter(final KeyboardKeys keyboardKey) {
    if (dictionaryRepository.setLetter(keyboardKey)) {
      emit(GridUpdateState());
    }
  }

  void removeLetter() {
    dictionaryRepository.removeLetter();
    emit(GridUpdateState());
  }

  void updateKey(final KeyboardKeys key, final LetterStatus letterStatus) {
    emit(KeyboardKeyUpdateState(key, letterStatus));
  }

  bool completeWord() {
    final state = dictionaryRepository.completeWord();
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
    }
    return false;
  }

  void clearArea() {
    dictionaryRepository.resetData();
    dictionaryRepository.createSecretWord();
    emit(MainInitial());
  }
}
