// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeneratedLocalization {
  GeneratedLocalization();

  static GeneratedLocalization? _current;

  static GeneratedLocalization get current {
    assert(_current != null,
        'No instance of GeneratedLocalization was loaded. Try to initialize the GeneratedLocalization delegate before accessing GeneratedLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeneratedLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeneratedLocalization();
      GeneratedLocalization._current = instance;

      return instance;
    });
  }

  static GeneratedLocalization of(BuildContext context) {
    final instance = GeneratedLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of GeneratedLocalization present in the widget tree. Did you add GeneratedLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static GeneratedLocalization? maybeOf(BuildContext context) {
    return Localizations.of<GeneratedLocalization>(
        context, GeneratedLocalization);
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `App dictionary`
  String get appDictionary {
    return Intl.message(
      'App dictionary',
      name: 'appDictionary',
      desc: '',
      args: [],
    );
  }

  /// `App language`
  String get appLanguage {
    return Intl.message(
      'App language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Wordly Plus`
  String get appTitle {
    return Intl.message(
      'Wordly Plus',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Default`
  String get casual {
    return Intl.message(
      'Default',
      name: 'casual',
      desc: '',
      args: [],
    );
  }

  /// `You can check your result here:`
  String get checkResult {
    return Intl.message(
      'You can check your result here:',
      name: 'checkResult',
      desc: '',
      args: [],
    );
  }

  /// `I couldn't guess the word in {attemptNumber} attempts.`
  String checkResultLose(Object attemptNumber) {
    return Intl.message(
      'I couldn\'t guess the word in $attemptNumber attempts.',
      name: 'checkResultLose',
      desc: '',
      args: [attemptNumber],
    );
  }

  /// `The word is solved in {attemptNumber}/6 attempts.`
  String checkResultWin(Object attemptNumber) {
    return Intl.message(
      'The word is solved in $attemptNumber/6 attempts.',
      name: 'checkResultWin',
      desc: '',
      args: [attemptNumber],
    );
  }

  /// `Color mode`
  String get colorMode {
    return Intl.message(
      'Color mode',
      name: 'colorMode',
      desc: '',
      args: [],
    );
  }

  /// `If you didn't find a word in the dictionary\nor it has the wrong definition,\nwrite to us, we will add it\nin the next update.\n`
  String get contact {
    return Intl.message(
      'If you didn\'t find a word in the dictionary\nor it has the wrong definition,\nwrite to us, we will add it\nin the next update.\n',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Current\nStreak`
  String get currentStreak {
    return Intl.message(
      'Current\nStreak',
      name: 'currentStreak',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get daily {
    return Intl.message(
      'Daily',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Guess distribution`
  String get guessDistribution {
    return Intl.message(
      'Guess distribution',
      name: 'guessDistribution',
      desc: '',
      args: [],
    );
  }

  /// `High contrast`
  String get highContrast {
    return Intl.message(
      'High contrast',
      name: 'highContrast',
      desc: '',
      args: [],
    );
  }

  /// `Level {number}`
  String levelNumber(Object number) {
    return Intl.message(
      'Level $number',
      name: 'levelNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Levels`
  String get levels {
    return Intl.message(
      'Levels',
      name: 'levels',
      desc: '',
      args: [],
    );
  }

  /// `You lost`
  String get loseMessage {
    return Intl.message(
      'You lost',
      name: 'loseMessage',
      desc: '',
      args: [],
    );
  }

  /// `Max\nStreak`
  String get maxStreak {
    return Intl.message(
      'Max\nStreak',
      name: 'maxStreak',
      desc: '',
      args: [],
    );
  }

  /// `Next level`
  String get nextLevel {
    return Intl.message(
      'Next level',
      name: 'nextLevel',
      desc: '',
      args: [],
    );
  }

  /// `Next word in`
  String get nextWord {
    return Intl.message(
      'Next word in',
      name: 'nextWord',
      desc: '',
      args: [],
    );
  }

  /// `You haven't played a single game`
  String get notPlayed {
    return Intl.message(
      'You haven\'t played a single game',
      name: 'notPlayed',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Played`
  String get played {
    return Intl.message(
      'Played',
      name: 'played',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get ru {
    return Intl.message(
      'Russian',
      name: 'ru',
      desc: '',
      args: [],
    );
  }

  /// `Secret word`
  String get secretWord {
    return Intl.message(
      'Secret word',
      name: 'secretWord',
      desc: '',
      args: [],
    );
  }

  /// `subject=WordlyPlus%20-%20New%20word&body=Word%20-%0AMeaning%20-`
  String get sendMessage {
    return Intl.message(
      'subject=WordlyPlus%20-%20New%20word&body=Word%20-%0AMeaning%20-',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Start game`
  String get start {
    return Intl.message(
      'Start game',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get statistic {
    return Intl.message(
      'Statistic',
      name: 'statistic',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `Theme mode`
  String get themeMode {
    return Intl.message(
      'Theme mode',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get themeSystem {
    return Intl.message(
      'System',
      name: 'themeSystem',
      desc: '',
      args: [],
    );
  }

  /// `How to play`
  String get tutorial {
    return Intl.message(
      'How to play',
      name: 'tutorial',
      desc: '',
      args: [],
    );
  }

  /// `View levels`
  String get viewLevels {
    return Intl.message(
      'View levels',
      name: 'viewLevels',
      desc: '',
      args: [],
    );
  }

  /// `View statistic`
  String get viewStatistic {
    return Intl.message(
      'View statistic',
      name: 'viewStatistic',
      desc: '',
      args: [],
    );
  }

  /// `You win!`
  String get winMessage {
    return Intl.message(
      'You win!',
      name: 'winMessage',
      desc: '',
      args: [],
    );
  }

  /// `Win\nrate`
  String get winRate {
    return Intl.message(
      'Win\nrate',
      name: 'winRate',
      desc: '',
      args: [],
    );
  }

  /// `Word not found in dictionary`
  String get wordNotFound {
    return Intl.message(
      'Word not found in dictionary',
      name: 'wordNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Word is not correct length`
  String get wordTooShort {
    return Intl.message(
      'Word is not correct length',
      name: 'wordTooShort',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<GeneratedLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GeneratedLocalization> load(Locale locale) =>
      GeneratedLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
