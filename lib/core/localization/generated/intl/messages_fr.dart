// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(value) => "Vous devez saisir au minimum ${value} caractères";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "backToHome": MessageLookupByLibrary.simpleMessage("Retourner à l’accueil"),
    "errorCannotOpenWebsite": MessageLookupByLibrary.simpleMessage(
      "Impossible d\'ouvrir le site",
    ),
    "errorEmail": MessageLookupByLibrary.simpleMessage("E-mail incorrect"),
    "errorGeneric": MessageLookupByLibrary.simpleMessage(
      "Une erreur est survenue",
    ),
    "errorGenericRetry": MessageLookupByLibrary.simpleMessage(
      "Une erreur est survenue, veuillez réessayer !",
    ),
    "errorMandatory": MessageLookupByLibrary.simpleMessage("Champ obligatoire"),
    "errorMinNumberCharacters": m0,
    "errorMustBePositiveDecimalNumber": MessageLookupByLibrary.simpleMessage(
      "Vous devez saisir une valeur décimale positive",
    ),
    "errorMustBePositiveInteger": MessageLookupByLibrary.simpleMessage(
      "Vous devez saisir une valeur entière positive",
    ),
    "errorPasswordNotIdentical": MessageLookupByLibrary.simpleMessage(
      "Les mots de passe doivent être identiques",
    ),
    "errorWhenRetrievingUserLocation": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite lors de la récupération de votre position",
    ),
    "errorWrongCredentials": MessageLookupByLibrary.simpleMessage(
      "Erreur d\'identifiant ou de mot de passe",
    ),
    "errorYouMustAcceptGeneralConditions": MessageLookupByLibrary.simpleMessage(
      "Vous devez accepter les conditions générales",
    ),
    "gcu": MessageLookupByLibrary.simpleMessage(
      "Conditions Générales d’Utilisation",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Chargement en cours…"),
    "notFoundSubTitle": MessageLookupByLibrary.simpleMessage(
      "La page que vous demandez est introuvable.",
    ),
    "notFoundTitle": MessageLookupByLibrary.simpleMessage(
      "Oups, on s’est perdus !",
    ),
    "tab1": MessageLookupByLibrary.simpleMessage("Onglet 1"),
    "tab2": MessageLookupByLibrary.simpleMessage("Onglet 2"),
    "tab3": MessageLookupByLibrary.simpleMessage("Onglet 3"),
    "tab4": MessageLookupByLibrary.simpleMessage("Onglet 4"),
    "tab5": MessageLookupByLibrary.simpleMessage("Onglet 5"),
  };
}
