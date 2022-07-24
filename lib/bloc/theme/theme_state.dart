part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState.changeTheme({
    required ThemeData theme,
    required bool isHighContrast,
  }) = _ChangeThemeState;
}
