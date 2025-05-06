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

  /// `What's up?`
  String get cheTam {
    return Intl.message(
      'What\'s up?',
      name: 'cheTam',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format`
  String get errorInvalidFormat {
    return Intl.message(
      'Invalid format',
      name: 'errorInvalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Timeout exceeded`
  String get errorTimeoutExceeded {
    return Intl.message(
      'Timeout exceeded',
      name: 'errorTimeoutExceeded',
      desc: '',
      args: [],
    );
  }

  /// `Unimplemented operation`
  String get errorUnimplementedError {
    return Intl.message(
      'Unimplemented operation',
      name: 'errorUnimplementedError',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported operation`
  String get errorUnsupportedError {
    return Intl.message(
      'Unsupported operation',
      name: 'errorUnsupportedError',
      desc: '',
      args: [],
    );
  }

  /// `File system error`
  String get errorFileSystemError {
    return Intl.message(
      'File system error',
      name: 'errorFileSystemError',
      desc: '',
      args: [],
    );
  }

  /// `Assertion error`
  String get errorAssertionError {
    return Intl.message(
      'Assertion error',
      name: 'errorAssertionError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get errorUnknownError {
    return Intl.message(
      'Unknown error',
      name: 'errorUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Bad internet connection`
  String get errorBadInternetConnection {
    return Intl.message(
      'Bad internet connection',
      name: 'errorBadInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unstable connection`
  String get errorConnectionException {
    return Intl.message(
      'Unstable connection',
      name: 'errorConnectionException',
      desc: '',
      args: [],
    );
  }

  /// `Download cancelled`
  String get errorDownloadCancelled {
    return Intl.message(
      'Download cancelled',
      name: 'errorDownloadCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Upload cancelled`
  String get errorUploadCancelled {
    return Intl.message(
      'Upload cancelled',
      name: 'errorUploadCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get errorInvalidCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'errorInvalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Email not confirmed`
  String get errorEmailNotConfirmed {
    return Intl.message(
      'Email not confirmed',
      name: 'errorEmailNotConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Tests`
  String get homeTabsTests {
    return Intl.message(
      'Tests',
      name: 'homeTabsTests',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get homeTabsResults {
    return Intl.message(
      'Results',
      name: 'homeTabsResults',
      desc: '',
      args: [],
    );
  }

  /// `Cohorts`
  String get homeTabsCohorts {
    return Intl.message(
      'Cohorts',
      name: 'homeTabsCohorts',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get homeTabsNotifications {
    return Intl.message(
      'Notifications',
      name: 'homeTabsNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get homeTabsProfile {
    return Intl.message(
      'Profile',
      name: 'homeTabsProfile',
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
      Locale.fromSubtags(languageCode: 'kk'),
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
