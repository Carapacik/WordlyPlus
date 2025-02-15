import 'dart:convert';

import 'package:wordly/src/feature/settings/model/change_color_result.dart';

/// {@template theme_mode_codec}
/// Codec for [ColorMode]
/// {@endtemplate}
final class ColorModeCodec extends Codec<ColorMode, String> {
  /// {@macro theme_mode_codec}
  const ColorModeCodec();

  @override
  Converter<String, ColorMode> get decoder => const _ColorModeDecoder();

  @override
  Converter<ColorMode, String> get encoder => const _ColorModeEncoder();
}

final class _ColorModeDecoder extends Converter<String, ColorMode> {
  const _ColorModeDecoder();

  @override
  ColorMode convert(String input) => switch (input) {
    'ColorMode.casual' => ColorMode.casual,
    'ColorMode.highContrast' => ColorMode.highContrast,
    'ColorMode.other' => ColorMode.other,
    _ => throw ArgumentError.value(input, 'input', 'Cannot convert $input to $ColorMode'),
  };
}

final class _ColorModeEncoder extends Converter<ColorMode, String> {
  const _ColorModeEncoder();

  @override
  String convert(ColorMode input) => switch (input) {
    ColorMode.casual => 'ColorMode.casual',
    ColorMode.highContrast => 'ColorMode.highContrast',
    ColorMode.other => 'ColorMode.other',
  };
}
