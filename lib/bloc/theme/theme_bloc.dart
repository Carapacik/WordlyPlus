import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required bool isDarkTheme, required bool isHighContrast})
      : super(
          ThemeState.changeTheme(
            isDarkTheme: isDarkTheme,
            isHighContrast: isHighContrast,
          ),
        ) {
    on<_ToggleThemeEvent>(_onThemeChanged);
    on<_ToggleHighContrastEvent>(_onHighContrastChanged);
  }

  void _onThemeChanged(
    _ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    // Save this to sp
    emit(state.copyWith(isDarkTheme: !state.isDarkTheme));
  }

  void _onHighContrastChanged(
    _ToggleHighContrastEvent event,
    Emitter<ThemeState> emit,
  ) {
    // Save this to sp
    emit(state.copyWith(isHighContrast: !state.isHighContrast));
  }
}
