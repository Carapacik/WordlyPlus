part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {required this.isDarkThemeOn,
      required this.isEngLang,
      required this.isHighContrast});

  final bool isDarkThemeOn;
  final bool isEngLang;
  final bool isHighContrast;

  @override
  List<Object?> get props => [isDarkThemeOn, isEngLang, isHighContrast];

  SettingsState copyWith({
    bool? isDarkThemeOn,
    bool? isEngLang,
    bool? isHighContrast,
  }) {
    return SettingsState(
      isDarkThemeOn: isDarkThemeOn ?? this.isDarkThemeOn,
      isEngLang: isEngLang ?? this.isEngLang,
      isHighContrast: isHighContrast ?? this.isHighContrast,
    );
  }
}
