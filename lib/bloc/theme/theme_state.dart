part of 'theme_bloc.dart';

@Freezed()
class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState.changeTheme({
    required bool isDarkTheme,
    required bool isHighContrast,
  }) = _ChangeThemeState;
}
