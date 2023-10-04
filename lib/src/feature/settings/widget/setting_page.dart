import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
            labelTypes: [],
            enableAlpha: false,
            portraitOnly: true,
          )
        ],
      ),
    );
  }
}
