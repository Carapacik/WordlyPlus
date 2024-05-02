import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordly/src/core/constant/localization/generated/l10n.dart';

/// {@template localization}
/// Localization class which is used to localize app.
/// This class provides handy methods and tools.
/// {@endtemplate}
final class Localization extends AppLocalizations {
  /// {@macro localization}
  Localization._({required this.locale});

  /// List of supported locales.
  static List<Locale> get supportedLocales => _delegate.supportedLocales;

  static const _delegate = AppLocalizations.delegate;

  /// List of localization delegates.
  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _delegate,
      ];

  /// {@macro localization}
  static Localization? get current => _current;

  /// {@macro localization}
  static Localization? _current;

  /// Locale which is currently used.
  final Locale locale;

  /// Computes the default locale.
  ///
  /// This is the locale that is used when no locale is specified.
  static Locale computeDefaultLocale({bool withDictionary = false}) {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    if (withDictionary &&
        const [
          Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'ru'),
        ].contains(locale)) {
      return locale;
    }

    if (_delegate.isSupported(locale)) {
      return locale;
    }

    return const Locale('en');
  }

  /// Obtain [AppLocalizations] instance from [BuildContext].
  static AppLocalizations of(BuildContext context) => AppLocalizations.of(context);
}
