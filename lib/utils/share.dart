import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

Future<void> shareEmojiString(final BuildContext context) async {
  final emojiString = R
      .stringsOf(context)
      .check_my_result(emoji: GetIt.I<DictionaryRepository>().getEmojiString);
  Share.share(emojiString);
}

Future<void> copyEmojiString(final BuildContext context) async {
  final emojiString = R
      .stringsOf(context)
      .check_my_result(emoji: GetIt.I<DictionaryRepository>().getEmojiString);
  await Clipboard.setData(ClipboardData(text: emojiString));
  await showTopFlushBar(
    context,
    message: R.stringsOf(context).text_copied,
  );
}
