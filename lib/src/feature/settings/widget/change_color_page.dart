import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/app/widget/theme_scope.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/components/widget/letter_tile.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({required this.previousResult, super.key});

  final ChangeColorResult previousResult;

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  late ColorMode _currentColorMode;

  late (Color, Color, Color) _currentOtherColors;

  int? _currentSelectedTileIndex;

  @override
  void initState() {
    super.initState();
    _currentColorMode = widget.previousResult.colorMode;
    if (_currentColorMode == ColorMode.other) {
      _currentSelectedTileIndex = 0;
    }
    _currentOtherColors = widget.previousResult.otherColors ?? (Colors.green, Colors.yellow, Colors.grey);
  }

  void _changeTheme(BuildContext context) {
    final themeScope = ThemeScope.of(context, listen: false);
    themeScope.setTheme(
      themeScope.theme.copyWith(
        colorMode: _currentColorMode,
        otherColors: _currentOtherColors,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final word = _wordByDictionary(DictionaryScope.of(context).dictionary);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(ChangeColorResult(colorMode: _currentColorMode, otherColors: _currentOtherColors));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(context.r.colorMode)),
        body: ConstraintScreen(
          child: ListView(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350, maxHeight: 60),
                child: Center(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: word.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) => LetterTile(
                      info: word[index],
                      color: _currentColorByStatus(
                        _currentColorMode,
                        word[index].status,
                      ),
                      selected: _currentSelectedTileIndex == index,
                      onTap: _currentColorMode == ColorMode.other
                          ? () {
                              if (word[index].status != LetterStatus.unknown) {
                                setState(() => _currentSelectedTileIndex = index);
                              }
                            }
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
                  onTap: () => setState(() {
                    _currentColorMode = ColorMode.values[index];
                    if (_currentColorMode != ColorMode.other) {
                      _currentSelectedTileIndex = null;
                    } else {
                      _currentSelectedTileIndex ??= 0;
                    }
                    _changeTheme(context);
                  }),
                ),
              ),
              const SizedBox(height: 8),
              if (_currentColorMode == ColorMode.other && _currentSelectedTileIndex != null)
                ColorPicker(
                  paletteType: PaletteType.hsl,
                  enableAlpha: false,
                  labelTypes: const [],
                  pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(8)),
                  pickerColor: _currentColorByStatus(
                        _currentColorMode,
                        _currentSelectedTileIndex == null ? null : word[_currentSelectedTileIndex!].status,
                      ) ??
                      context.theme.colorScheme.background,
                  onColorChanged: (color) {
                    final status = word[_currentSelectedTileIndex!].status;
                    setState(() {
                      _currentOtherColors = (
                        status == LetterStatus.correctSpot ? color : _currentOtherColors.$1,
                        status == LetterStatus.wrongSpot ? color : _currentOtherColors.$2,
                        status == LetterStatus.notInWord ? color : _currentOtherColors.$3
                      );
                      _changeTheme(context);
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color? _currentColorByStatus(ColorMode mode, LetterStatus? status) {
    if (status == null || mode != ColorMode.other) {
      return null;
    }
    final otherModeColors = {
      LetterStatus.correctSpot: _currentOtherColors.$1,
      LetterStatus.wrongSpot: _currentOtherColors.$2,
      LetterStatus.notInWord: _currentOtherColors.$3,
    };
    return otherModeColors[status];
  }

  List<LetterInfo> _wordByDictionary(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 'p', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'a'),
          LetterInfo(letter: 'u', status: LetterStatus.notInWord),
          LetterInfo(letter: 's', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'e'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'п', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'а'),
          LetterInfo(letter: 'у', status: LetterStatus.notInWord),
          LetterInfo(letter: 'з', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }
}
