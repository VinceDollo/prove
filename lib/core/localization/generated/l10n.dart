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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Retourner à l’accueil`
  String get backToHome {
    return Intl.message(
      'Retourner à l’accueil',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Impossible d'ouvrir le site`
  String get errorCannotOpenWebsite {
    return Intl.message(
      'Impossible d\'ouvrir le site',
      name: 'errorCannotOpenWebsite',
      desc: '',
      args: [],
    );
  }

  /// `E-mail incorrect`
  String get errorEmail {
    return Intl.message(
      'E-mail incorrect',
      name: 'errorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Une erreur est survenue`
  String get errorGeneric {
    return Intl.message(
      'Une erreur est survenue',
      name: 'errorGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Une erreur est survenue, veuillez réessayer !`
  String get errorGenericRetry {
    return Intl.message(
      'Une erreur est survenue, veuillez réessayer !',
      name: 'errorGenericRetry',
      desc: '',
      args: [],
    );
  }

  /// `Champ obligatoire`
  String get errorMandatory {
    return Intl.message(
      'Champ obligatoire',
      name: 'errorMandatory',
      desc: '',
      args: [],
    );
  }

  /// `Vous devez saisir au minimum {value} caractères`
  String errorMinNumberCharacters(Object value) {
    return Intl.message(
      'Vous devez saisir au minimum $value caractères',
      name: 'errorMinNumberCharacters',
      desc: '',
      args: [value],
    );
  }

  /// `Vous devez saisir une valeur décimale positive`
  String get errorMustBePositiveDecimalNumber {
    return Intl.message(
      'Vous devez saisir une valeur décimale positive',
      name: 'errorMustBePositiveDecimalNumber',
      desc: '',
      args: [],
    );
  }

  /// `Vous devez saisir une valeur entière positive`
  String get errorMustBePositiveInteger {
    return Intl.message(
      'Vous devez saisir une valeur entière positive',
      name: 'errorMustBePositiveInteger',
      desc: '',
      args: [],
    );
  }

  /// `Les mots de passe doivent être identiques`
  String get errorPasswordNotIdentical {
    return Intl.message(
      'Les mots de passe doivent être identiques',
      name: 'errorPasswordNotIdentical',
      desc: '',
      args: [],
    );
  }

  /// `Une erreur s'est produite lors de la récupération de votre position`
  String get errorWhenRetrievingUserLocation {
    return Intl.message(
      'Une erreur s\'est produite lors de la récupération de votre position',
      name: 'errorWhenRetrievingUserLocation',
      desc: '',
      args: [],
    );
  }

  /// `Erreur d'identifiant ou de mot de passe`
  String get errorWrongCredentials {
    return Intl.message(
      'Erreur d\'identifiant ou de mot de passe',
      name: 'errorWrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Vous devez accepter les conditions générales`
  String get errorYouMustAcceptGeneralConditions {
    return Intl.message(
      'Vous devez accepter les conditions générales',
      name: 'errorYouMustAcceptGeneralConditions',
      desc: '',
      args: [],
    );
  }

  /// `Conditions Générales d’Utilisation`
  String get gcu {
    return Intl.message(
      'Conditions Générales d’Utilisation',
      name: 'gcu',
      desc: '',
      args: [],
    );
  }

  /// `Chargement en cours…`
  String get loading {
    return Intl.message(
      'Chargement en cours…',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `La page que vous demandez est introuvable.`
  String get notFoundSubTitle {
    return Intl.message(
      'La page que vous demandez est introuvable.',
      name: 'notFoundSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Oups, on s’est perdus !`
  String get notFoundTitle {
    return Intl.message(
      'Oups, on s’est perdus !',
      name: 'notFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `Onglet 1`
  String get tab1 {
    return Intl.message('Onglet 1', name: 'tab1', desc: '', args: []);
  }

  /// `Onglet 2`
  String get tab2 {
    return Intl.message('Onglet 2', name: 'tab2', desc: '', args: []);
  }

  /// `Onglet 3`
  String get tab3 {
    return Intl.message('Onglet 3', name: 'tab3', desc: '', args: []);
  }

  /// `Onglet 4`
  String get tab4 {
    return Intl.message('Onglet 4', name: 'tab4', desc: '', args: []);
  }

  /// `Onglet 5`
  String get tab5 {
    return Intl.message('Onglet 5', name: 'tab5', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'fr')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
