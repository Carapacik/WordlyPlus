import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/app/widget/locale_scope.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';

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
          Row(
            children: [
              TextButton(
                onPressed: () {
                  DictionaryScope.of(context).setDictionary(const Locale('ru'));
                  context.read<GameBloc>().add(const GameEvent.changeDictionary(Locale('ru')));
                },
                child: const Text('ru'),
              ),
              TextButton(
                onPressed: () {
                  DictionaryScope.of(context).setDictionary(const Locale('en'));
                  context.read<GameBloc>().add(const GameEvent.changeDictionary(Locale('en')));
                },
                child: const Text('en'),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  LocaleScope.of(context).setLocale(const Locale('ru'));
                },
                child: const Text('ru'),
              ),
              TextButton(
                onPressed: () {
                  LocaleScope.of(context).setLocale(const Locale('en'));
                },
                child: const Text('en'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
