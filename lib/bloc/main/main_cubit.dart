import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/dictionary_repository.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/domain/settings_repository.dart';

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
      dictionaryRepository.saveBoard();
      emit(state);
      if (state is WinGameState || state is LoseGameState) {
        GetIt.I<DailyResultRepository>().saveDailyResult(
          isWin: state is WinGameState,
          word: dictionaryRepository.secretWord,
          language:
              GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage,
        );
        GetIt.I<DailyStatisticRepository>().saveStatisticData(
          isWin: state is WinGameState,
          attempt: dictionaryRepository.currentAttempt,
        );
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
