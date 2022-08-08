import 'package:get_it/get_it.dart';
import 'package:wordly/data/repositories.dart';

Future<void> setupServiceLocators() async {
  GetIt.I.registerSingleton<ISaveSettingsRepository>(
    SaveSettingsRepository(),
  );
  GetIt.I.registerSingleton<ISaveLevelsRepository>(
    SaveLevelsRepository(),
  );
  GetIt.I.registerSingleton<ISaveStatisticRepository>(
    SaveStatisticRepository(),
  );
  GetIt.I.registerSingleton<ISaveGameRepository>(
    SaveGameRepository(),
  );
}
