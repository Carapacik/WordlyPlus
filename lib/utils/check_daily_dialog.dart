import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/ui/widgets/widgets.dart';

Future<void> checkDailyDialog(
  final BuildContext context, {
  final bool? isWin,
}) async {
  final secretWord = GetIt.I<DictionaryRepository>().secretWord;
  final secretWordMeaning = GetIt.I<DictionaryRepository>().secretWordMeaning;
  if (isWin != null) {
    await showWinLoseDialog(
      context,
      isWin: isWin,
      word: secretWord,
      secretWordMeaning: secretWordMeaning,
    );
  } else {
    final dailyResult = GetIt.I<DailyResultRepository>().dailyResult;
    if (dailyResult.dailyWord == secretWord) {
      await showWinLoseDialog(
        context,
        isWin: dailyResult.isWin,
        word: secretWord,
        secretWordMeaning: secretWordMeaning,
      );
    }
  }
}
