import 'package:get_it/get_it.dart';
import 'package:wordly/domain/game_service.dart';
import 'package:wordly/domain/settings_service.dart';

Future<void> setupServiceLocators() async {
  await _initSPService();
  await _initGameService();
}

Future<void> _initSPService() async {
  GetIt.I.registerSingleton<SaveSettingsService>(
    SaveSettingsService(),
  );
}

Future<void> _initGameService() async {
  GetIt.I.registerSingleton<SaveGameService>(
    SaveGameService(),
  );
}
