part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState.changeTheme({
    required bool isDarkTheme,
    required bool isHighContrast,
  }) = _ChangeThemeState;
}
