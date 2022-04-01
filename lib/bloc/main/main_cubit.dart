import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/domain/board_repository.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/domain/level_repository.dart';
import 'package:wordly/domain/settings_repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.dictionaryRepository) : super(MainInitial());
  final DictionaryRepository dictionaryRepository;

  void setLetter(final KeyboardKeys keyboardKey) {
    if (dictionaryRepository.setLetter(keyboardKey)) {
      emit(GridUpdateState());
    }
  }

  void removeLetter() {
    dictionaryRepository.removeLetter();
    emit(GridUpdateState());
  }

  void removeFullWord() {
    dictionaryRepository.removeFullWord();
    emit(GridUpdateState());
  }

  void updateKey(final KeyboardKeys key, final LetterStatus letterStatus) {
    emit(KeyboardKeyUpdateState(key, letterStatus));
  }

  bool completeWord() {
    final levelRepository = GetIt.I<LevelRepository>();
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
        if (levelRepository.isLevelMode) {
          GetIt.I<LevelRepository>().saveLevelData(
            level: levelRepository.levelData.lastLevel++,
            secretWord: dictionaryRepository.secretWord,
          );
        } else {
          final dictionaryLanguage =
              GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage;
          GetIt.I<DailyResultRepository>().saveDailyResult(
            isWin: state is WinGameState,
            word: dictionaryRepository.secretWord,
            language: dictionaryLanguage,
          );
          GetIt.I<DailyStatisticRepository>().saveStatisticData(
            isWin: state is WinGameState,
            attempt: dictionaryRepository.currentAttempt,
          );
        }
        emit(GridUpdateState());
      }
      return true;
    } else if (state is TopMessageState) {
      emit(state);
    }
    return false;
  }

  Future<void> loadDaily() async {
    final settingsRepository = GetIt.I<SettingsRepository>();
    final boardRepository = GetIt.I<BoardRepository>();
    final levelRepository = GetIt.I<LevelRepository>();
    levelRepository.levelMode = false;
    final dictionaryLanguage =
        settingsRepository.settingsData.dictionaryLanguage;
    dictionaryRepository.resetData();
    dictionaryRepository.createSecretWord();
    await boardRepository.initBoardData(
      dictionaryLanguage: dictionaryLanguage,
      levelNumber: 0,
    );
    dictionaryRepository.loadBoard();
    emit(MainInitial());
  }

  Future<void> loadLevels() async {
    final settingsRepository = GetIt.I<SettingsRepository>();
    final boardRepository = GetIt.I<BoardRepository>();
    final levelRepository = GetIt.I<LevelRepository>();
    levelRepository.levelMode = true;
    final dictionaryLanguage =
        settingsRepository.settingsData.dictionaryLanguage;
    await levelRepository.initLevelData(dictionaryLanguage);
    dictionaryRepository.resetData();
    final levelNumber = levelRepository.levelData.lastLevel;
    dictionaryRepository.createSecretWord(levelNumber);
    await boardRepository.initBoardData(
      dictionaryLanguage: dictionaryLanguage,
      levelNumber: levelNumber,
    );
    dictionaryRepository.loadBoard();
    emit(MainInitial());
  }

  void nextLevel() {
    dictionaryRepository.resetData();
    final levelNumber = GetIt.I<LevelRepository>().levelData.lastLevel;
    dictionaryRepository.createSecretWord(levelNumber);
    emit(MainInitial());
  }

  void clearArea() {
    dictionaryRepository.resetData();
    dictionaryRepository.createSecretWord();
    emit(MainInitial());
  }
}
