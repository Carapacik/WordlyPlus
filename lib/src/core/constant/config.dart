import 'package:wordly/src/feature/initialization/model/environment.dart';

/// Application configuration
class Config {
  /// Creates a new [Config] instance.
  const Config();

  /// The current environment.
  Environment get environment {
    var environment = const String.fromEnvironment('ENVIRONMENT');

    if (environment.isNotEmpty) {
      return Environment.from(environment);
    }

    environment = const String.fromEnvironment('FLUTTER_APP_FLAVOR');

    return Environment.from(environment);
  }

  double get maxMobileWidth => 768;

  String get email => 'carapacik@gmail.com';

  String get webLink => 'https://carapacik.github.io/WordlyPlus/';

  String get androidLink => 'https://play.google.com/store/apps/details?id=com.carapacik.wordly';
}
