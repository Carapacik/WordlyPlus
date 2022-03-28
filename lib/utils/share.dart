// String _getEmojiStringFromGrid() {
//   final letterDataList = DictionaryData.getInstance().letterDataList;
//   String emojiString = "";
//   letterDataList.asMap().map((key, value) {
//     emojiString += value.status.toEmoji();
//     if (key % 5 == 4) {
//       emojiString += "\n";
//     }
//     return MapEntry(key, value);
//   });
//   return emojiString;
// }
//
// Future<void> shareEmojiString(final BuildContext context) async {
//   final emojiString =
//   R.stringsOf(context).check_my_result(emoji: _getEmojiStringFromGrid());
//   Share.share(emojiString);
// }
//
// Future<void> copyEmojiString(
//     final BuildContext context,
//     ) async {
//   final emojiString =
//   R.stringsOf(context).check_my_result(emoji: _getEmojiStringFromGrid());
//   await Clipboard.setData(ClipboardData(text: emojiString));
//   await showTopFlushBar(
//     context,
//     message: R.stringsOf(context).text_copied,
//   );
// }
