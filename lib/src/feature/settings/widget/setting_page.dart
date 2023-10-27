import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/app/widget/locale_scope.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/settings/widget/language_selector.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool lightTheme = true;
  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);

  void changeColors(List<Color> colors) => setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ColorPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
            labelTypes: const [],
            enableAlpha: false,
            portraitOnly: true,
          ),
          LanguageSelector(
            title: 'Dictionary',
            value: DictionaryScope.of(context).dictionary,
            items: const [Locale('ru'), Locale('en')],
            onTap: (d) {
              DictionaryScope.of(context).setDictionary(d);
              context.read<GameBloc>().add(GameEvent.changeDictionary(d));
            },
          ),
          LanguageSelector(
            title: 'Localization',
            value: LocaleScope.of(context).locale,
            items: const [Locale('ru'), Locale('en')],
            onTap: (l) => LocaleScope.of(context).setLocale(l),
          ),
        ],
      ),
    );
  }
}
