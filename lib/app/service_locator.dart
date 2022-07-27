import 'package:get_it/get_it.dart';
import 'package:wordly/domain/shared_preferences_service.dart';

Future<void> setupServiceLocators() async {
  await _initSPService();
  await _initLocaleStorage();
}


Future<void> _initSPService() async {
  GetIt.I.registerSingleton<SharedPreferencesService>(
    SharedPreferencesService(),
  );
}

Future<void> _initLocaleStorage() async {}