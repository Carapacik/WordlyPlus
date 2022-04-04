import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/domain/level_repository.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

Future<void> checkResultDialog(
  final BuildContext context, {
  final bool? isWin,
}) async {
  final levelRepository = GetIt.I<LevelRepository>();
  final dictionaryRepository = GetIt.I<DictionaryRepository>();
  final isLevelMode = levelRepository.isLevelMode;
  final secretWord = dictionaryRepository.secretWord;
  final secretWordMeaning = dictionaryRepository.secretWordMeaning;
  if (isWin != null) {
    if (isLevelMode) {
      await showLevelResultDialog(
        context,
        isWin: isWin,
        word: secretWord,
        secretWordMeaning: secretWordMeaning,
      );
    } else {
      await showDailyResultDialog(
        context,
        isWin: isWin,
        word: secretWord,
        secretWordMeaning: secretWordMeaning,
      );
    }
  } else {
    final dailyResult = GetIt.I<DailyResultRepository>().dailyResult;
    if (!isLevelMode && dailyResult.dailyWord == secretWord) {
      await showDailyResultDialog(
        context,
        isWin: dailyResult.isWin,
        word: secretWord,
        secretWordMeaning: secretWordMeaning,
      );
    }
  }
}
