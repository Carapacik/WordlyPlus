import 'package:wordly/data/models/settings_data.dart';

abstract class SettingsRepository {
  SettingsData get settingsData;

  Future<void> initSettings();

  Future<void> saveSettings(final SettingsData data);
}
