part of 'settings_cubit.dart';

class SwitchState extends Equatable {
  final bool isDarkThemeOn;
  final bool isEngLang;
  final bool isHighContrast;

  SwitchState({required this.isDarkThemeOn, required this.isEngLang, required this.isHighContrast});

  @override
  List<Object?> get props => [isDarkThemeOn, isEngLang, isHighContrast];

  SwitchState copyWith({
    bool? isDarkThemeOn,
    bool? isEngLang,
    bool? isHighContrast,
  }) {
    return SwitchState(
      isDarkThemeOn: isDarkThemeOn ?? this.isDarkThemeOn,
      isEngLang: isEngLang ?? this.isEngLang,
      isHighContrast: isHighContrast ?? this.isHighContrast,
    );
  }
}
