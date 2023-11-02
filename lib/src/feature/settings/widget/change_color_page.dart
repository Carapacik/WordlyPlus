import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({required this.colorMode, super.key});

  final ColorMode colorMode;

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  bool lightTheme = true;
  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);

  void changeColors(List<Color> colors) => setState(() => currentColors = colors);
  late ColorMode _currentColorMode;

  @override
  void initState() {
    super.initState();
    _currentColorMode = widget.colorMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.r.colorMode)),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: ColorMode.values.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                ColorMode.values[index].localized(context),
                style: context.theme.bl,
              ),
              trailing: _currentColorMode == ColorMode.values[index] ? const Icon(Icons.check) : null,
              onTap: () => setState(() => _currentColorMode = ColorMode.values[index]),
            ),
          ),
          if (_currentColorMode == ColorMode.other)
            ColorPicker(
              paletteType: PaletteType.hsl,
              enableAlpha: false,
              labelTypes: const [],
              pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(8)),
              pickerColor: currentColor,
              onColorChanged: changeColor,
            ),
        ],
      ),
    );
  }
}

enum ColorMode {
  casual,
  highContrast,
  other;

  String localized(BuildContext context) {
    switch (this) {
      case ColorMode.casual:
        return context.r.casual;
      case ColorMode.highContrast:
        return context.r.highContrast;
      case ColorMode.other:
        return context.r.other;
    }
  }
}
