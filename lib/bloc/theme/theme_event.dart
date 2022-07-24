part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const ThemeEvent._();

  const factory ThemeEvent.toggleTheme() = _ToggleThemeEvent;

  const factory ThemeEvent.toggleHighContrast() = _ToggleHighContrastEvent;
}
