import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/ui/widgets/widgets.dart';

Future<void> checkDailyDialog(
  final BuildContext context, {
  final bool? isWin,
}) async {
  final word = GetIt.I<DictionaryRepository>().secretWord;
  if (isWin != null) {
    await showWinLoseDialog(
      context,
      isWin: isWin,
      word: word,
    );
  } else {
    final dailyResult = GetIt.I<DailyResultRepository>().dailyResult;
    if (dailyResult.dailyWord == word) {
      await showWinLoseDialog(
        context,
        isWin: dailyResult.isWin,
        word: word,
      );
    }
  }
}
