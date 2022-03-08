import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            isDarkThemeOn: false,
            isHighContrast: false,
            language: "en",
          ),
        );

  void toggleTheme({required bool value}) => emit(
        state.copyWith(isDarkThemeOn: value),
      );

  void toggleContrast({required bool value}) => emit(
        state.copyWith(isHighContrast: value),
      );

  void changeLanguage({required String value}) => emit(
        state.copyWith(language: value),
      );

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final isDarkTheme = json['is_dark_theme'] as bool;
    final isHighContrast = json['is_high_contrast'] as bool;
    final language = json['settings_language'] as String;

    return SettingsState(
      isDarkThemeOn: isDarkTheme,
      isHighContrast: isHighContrast,
      language: language,
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      "is_dark_theme": state.isDarkThemeOn.toString(),
      "is_high_contrast": state.isHighContrast.toString(),
      "settings_language": state.language,
    };
  }
}
