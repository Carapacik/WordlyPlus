import 'package:flutter/material.dart';

@immutable
class BackgroundCustomColors extends ThemeExtension<BackgroundCustomColors> {
  const BackgroundCustomColors({required this.background});

  final Color? background;

  @override
  ThemeExtension<BackgroundCustomColors> copyWith({Color? background}) =>
      BackgroundCustomColors(background: background ?? this.background);

  @override
  ThemeExtension<BackgroundCustomColors> lerp(covariant ThemeExtension<BackgroundCustomColors>? other, double t) {
    if (other is! BackgroundCustomColors) {
      return this;
    }
    return BackgroundCustomColors(background: Color.lerp(background, other.background, t));
  }
}
