import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/app/data/theme_repository.dart';
import 'package:wordly/src/feature/app/model/app_theme.dart';
import 'package:wordly/src/feature/app/widget/theme_scope.dart';

part 'theme_bloc.freezed.dart';

/// {@template theme_event}
/// Theme event
/// {@endtemplate}
@Freezed()
sealed class ThemeEvent with _$ThemeEvent {
  /// Update the theme
  const factory ThemeEvent.update(AppTheme theme) = _ThemeEventUpdate;
}

/// {@template theme_state}
/// Theme state
/// {@endtemplate}
@Freezed()
sealed class ThemeState with _$ThemeState {
  /// Idle state
  const factory ThemeState.idle(AppTheme theme) = _ThemeStateIdle;

  /// In Progress state
  const factory ThemeState.inProgress(AppTheme theme) = _ThemeStateInProgress;
}

/// {@template theme_bloc}
/// Business logic components that can switch themes.
///
/// It communicates with provided repository to persist the theme.
///
/// Should not be used directly, instead use [ThemeScope].
/// It operates ThemeBloc under the hood.
/// {@endtemplate}
final class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// {@macro theme_bloc}
  ThemeBloc(this._themeRepository)
      : super(ThemeState.idle(_themeRepository.loadAppThemeFromCache() ?? AppTheme.system)) {
    on<ThemeEvent>(
      (event, emit) => event.map(update: (e) async => _update(e, emit)),
    );
  }

  final ThemeRepository _themeRepository;

  Future<void> _update(
    _ThemeEventUpdate event,
    Emitter<ThemeState> emit,
  ) async {
    final oldTheme = state.theme;
    try {
      emit(ThemeState.inProgress(event.theme));
      await _themeRepository.setTheme(event.theme);
      emit(ThemeState.idle(event.theme));
    } on Object catch (_) {
      logger.warning('Failed to update theme to $event, reverting to $oldTheme');
      emit(ThemeState.idle(oldTheme));
      rethrow;
    }
  }
}
