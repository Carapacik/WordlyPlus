import 'package:get_it/get_it.dart';
import 'package:wordly/data/repositories.dart';

Future<void> setupServiceLocators() async {
  GetIt.I.registerSingletonAsync<ISaveSettingsRepository>(
    () => Future.value(SaveSettingsRepository()),
  );
  GetIt.I.registerSingletonAsync<ISaveLevelsRepository>(
    () => Future.value(SaveLevelsRepository()),
  );
  GetIt.I.registerSingletonAsync<ISaveStatisticRepository>(
    () => Future.value(SaveStatisticRepository()),
  );
  GetIt.I.registerSingletonAsync<ISaveGameRepository>(
    () => Future.value(SaveGameRepository()),
  );
}
