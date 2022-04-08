import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordly/app.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/collections/board_data.dart';
import 'package:wordly/data/collections/daily_result_data.dart';
import 'package:wordly/data/collections/daily_statistic_data.dart';
import 'package:wordly/data/collections/level_data.dart';
import 'package:wordly/data/collections/settings_data.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/data/repositories/dictionary_repository_impl.dart';
import 'package:wordly/domain/board_repository.dart';
import 'package:wordly/domain/board_repository_impl.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/domain/daily_result_repository_impl.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/domain/daily_statistic_repository_impl.dart';
import 'package:wordly/domain/level_repository.dart';
import 'package:wordly/domain/level_repository_impl.dart';
import 'package:wordly/domain/settings_repository.dart';
import 'package:wordly/domain/settings_repository_impl.dart';
import 'package:wordly/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  await checkForAndroidUpdate();
  await _initSingletons();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (_) =>
              SettingsCubit(GetIt.I<SettingsRepository>().settingsData),
        ),
        BlocProvider<MainCubit>(
          create: (_) => MainCubit(GetIt.I<DictionaryRepository>()),
        ),
      ],
      child: const App(),
    ),
  );
}

Future<void> _initSingletons() async {
  await _initLocaleStorage();
  await _initSettingsRepository();
  await _initDailyResultRepository();
  await _initDailyStatisticRepository();
  await _initLevelRepository();
  await _initBoardRepository();
  await _initDictionaryRepository();
}

Future<void> _initLocaleStorage() async {
  String? directoryPath;
  if (!kIsWeb) {
    directoryPath = (await getApplicationSupportDirectory()).path;
  }
  final isar = await Isar.open(
    directory: directoryPath,
    schemas: [
      BoardDataSchema,
      DailyResultDataSchema,
      DailyStatisticDataSchema,
      LevelDataSchema,
      SettingsDataSchema,
    ],
  );
  GetIt.I.registerLazySingleton<Isar>(() => isar);
}

Future<void> _initSettingsRepository() async {
  GetIt.I.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(),
  );
  await GetIt.I<SettingsRepository>().initSettings();
}

Future<void> _initDailyResultRepository() async {
  GetIt.I.registerSingleton<DailyResultRepository>(
    DailyResultRepositoryImpl(),
  );
  await GetIt.I<DailyResultRepository>().initDailyResult(
    GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage,
  );
}

Future<void> _initDailyStatisticRepository() async {
  GetIt.I.registerSingleton<DailyStatisticRepository>(
    DailyStatisticRepositoryImpl(),
  );
  await GetIt.I<DailyStatisticRepository>().initStatisticData(
    GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage,
  );
}

Future<void> _initLevelRepository() async {
  GetIt.I.registerSingleton<LevelRepository>(
    LevelRepositoryImpl(),
  );
  await GetIt.I<LevelRepository>().initLevelData(
    GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage,
  );
}

Future<void> _initBoardRepository() async {
  GetIt.I.registerSingleton<BoardRepository>(
    BoardRepositoryImpl(),
  );
  // level number = 0 for daily
  await GetIt.I<BoardRepository>().initBoardData(
    dictionaryLanguage:
        GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage,
    levelNumber: 0,
  );
}

Future<void> _initDictionaryRepository() async {
  GetIt.I.registerSingleton<DictionaryRepository>(
    DictionaryRepositoryImpl(),
  );
  final dictionaryRepository = GetIt.I<DictionaryRepository>();
  dictionaryRepository.dictionaryLanguage =
      GetIt.I<SettingsRepository>().settingsData.dictionaryLanguage;
  dictionaryRepository.createSecretWord();
  dictionaryRepository.loadBoard();
}
