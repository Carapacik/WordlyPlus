import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            isDarkThemeOn: false,
            isEngLang: false,
            isHighContrast: false,
          ),
        );

  void toggleTheme({required bool value}) =>
      emit(state.copyWith(isDarkThemeOn: value));

  void toggleLanguage({required bool value}) =>
      emit(state.copyWith(isEngLang: value));

  void toggleContrast({required bool value}) =>
      emit(state.copyWith(isHighContrast: value));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final isDarkTheme = json['isDarkTheme'] as bool;
    final isEngLang = json['isEngLang'] as bool;
    final isHighContrast = json['isHighContrast'] as bool;

    return SettingsState(
      isDarkThemeOn: isDarkTheme,
      isEngLang: isEngLang,
      isHighContrast: isHighContrast,
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      "isDarkTheme": state.isDarkThemeOn.toString(),
      "isEngLang": state.isEngLang.toString(),
      "isHighContrast": state.isHighContrast.toString(),
    };
  }
}
