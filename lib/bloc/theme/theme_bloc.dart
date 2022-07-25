import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(
    ThemeData themeData, {
    bool isHighContrast = false,
  }) : super(
          ThemeState.changeTheme(
            theme: themeData,
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
    if (state.theme.brightness == Brightness.dark) {
      emit(state.copyWith(theme: ThemeData.light()));
      return;
    }
    emit(state.copyWith(theme: ThemeData.dark()));
  }

  void _onHighContrastChanged(
    _ToggleHighContrastEvent event,
    Emitter<ThemeState> emit,
  ) {
    // Save this to sp
    emit(state.copyWith(isHighContrast: !state.isHighContrast));
  }
}
