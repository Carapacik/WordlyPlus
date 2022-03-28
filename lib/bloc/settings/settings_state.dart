part of 'settings_cubit.dart';

// TODO replace with freezed
abstract class SettingsState extends Equatable {
  const SettingsState({
    required this.dictionaryLanguage,
    required this.localeLanguage,
    required this.isDark,
    required this.isHighContrast,
  });

  final DictionaryLanguages dictionaryLanguage;
  final LocaleLanguages localeLanguage;
  final bool isDark;
  final bool isHighContrast;

  SettingsState copyWith({
    DictionaryLanguages? dictionaryLanguage,
    LocaleLanguages? localeLanguage,
    bool? isDark,
    bool? isHighContrast,
  }) {
    return SettingsUpdate(
      dictionaryLanguage: dictionaryLanguage ?? this.dictionaryLanguage,
      localeLanguage: localeLanguage ?? this.localeLanguage,
      isDark: isDark ?? this.isDark,
      isHighContrast: isHighContrast ?? this.isHighContrast,
    );
  }

  @override
  List<Object> get props =>
      [dictionaryLanguage, localeLanguage, isDark, isHighContrast];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial({
    required DictionaryLanguages dictionaryLanguage,
    required LocaleLanguages localeLanguage,
    required bool isDark,
    required bool isHighContrast,
  }) : super(
          dictionaryLanguage: dictionaryLanguage,
          localeLanguage: localeLanguage,
          isDark: isDark,
          isHighContrast: isHighContrast,
        );
}

class SettingsUpdate extends SettingsState {
  const SettingsUpdate({
    required DictionaryLanguages dictionaryLanguage,
    required LocaleLanguages localeLanguage,
    required bool isDark,
    required bool isHighContrast,
  }) : super(
          dictionaryLanguage: dictionaryLanguage,
          localeLanguage: localeLanguage,
          isDark: isDark,
          isHighContrast: isHighContrast,
        );
}
