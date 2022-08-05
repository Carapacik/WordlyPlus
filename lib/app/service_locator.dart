import 'package:get_it/get_it.dart';
import 'package:wordly/domain/save_game_service.dart';
import 'package:wordly/domain/save_settings_service.dart';
import 'package:wordly/domain/save_statistic_service.dart';

Future<void> setupServiceLocators() async {
  _initSaveSettingsService();
  _initSaveGameService();
  _initSaveStatisticService();
}

Future<void> _initSaveSettingsService() async {
  GetIt.I.registerSingleton<ISaveSettingsService>(
    SaveSettingsService(),
  );
}

Future<void> _initSaveGameService() async {
  GetIt.I.registerSingleton<ISaveGameService>(
    SaveGameService(),
  );
}

Future<void> _initSaveStatisticService() async {
  GetIt.I.registerSingleton<ISaveStatisticService>(
    SaveStatisticService(),
  );
}
