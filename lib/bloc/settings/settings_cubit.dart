import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SwitchState> {
  SettingsCubit()
      : super(
          SwitchState(
            isDarkThemeOn: false,
            isEngLang: false,
            isHighContrast: false,
          ),
        );

  void toggleTheme({required bool value}) =>
      emit(state.copyWith(isDarkThemeOn: value));

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    final isDarkTheme = json['isDarkTheme'] as bool;
    final isEngLang = json['isEngLang'] as bool;
    final isHighContrast = json['isHighContrast'] as bool;

    return SwitchState(
      isDarkThemeOn: isDarkTheme,
      isEngLang: isEngLang,
      isHighContrast: isHighContrast,
    );
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return {
      "isDarkTheme": state.isDarkThemeOn.toString(),
      "isEngLang": state.isEngLang.toString(),
      "isHighContrast": state.isHighContrast.toString(),
    };
  }
}
