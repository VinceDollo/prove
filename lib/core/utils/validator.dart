import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starter/core/localization/generated/l10n.dart';
import 'package:flutter_starter/core/values/constants.dart';

String? validateStringNotNullOrEmpty(
  String? stringEntered,
  BuildContext context,
) {
  if (stringEntered == null || stringEntered.isEmpty) {
    return S.of(context).errorMandatory;
  }
  return null;
}

String? validateStringIsInteger(String stringEntered, BuildContext context) {
  final notEmpty = validateStringNotNullOrEmpty(stringEntered, context);
  if (notEmpty != null) return notEmpty;

  final parsedValue = int.tryParse(stringEntered);
  if (parsedValue == null || parsedValue <= 0) {
    return S.of(context).errorMustBePositiveInteger;
  }
  return null;
}

String? validateNotEmptyIsDecimal(String? stringEntered, BuildContext context) {
  if (stringEntered == null || stringEntered.isEmpty) return null;
  return validateStringIsDecimal(stringEntered, context);
}

String? validateStringIsDecimal(String stringEntered, BuildContext context) {
  final notEmpty = validateStringNotNullOrEmpty(stringEntered, context);
  if (notEmpty != null) return notEmpty;
  final parsedValue = double.tryParse(stringEntered.replaceAll(',', '.'));
  if (parsedValue == null || parsedValue <= 0) {
    return S.of(context).errorMustBePositiveDecimalNumber;
  }
  return null;
}

String? validateEmail(String? stringEntered, BuildContext context) {
  final notEmpty = validateStringNotNullOrEmpty(stringEntered, context);
  if (notEmpty != null) return notEmpty;
  if (!EmailValidator.validate(stringEntered!)) return S.of(context).errorEmail;
  return null;
}

String? validatePassword(String? stringEntered, BuildContext context) {
  final notEmpty = validateStringNotNullOrEmpty(stringEntered, context);
  if (notEmpty != null) return notEmpty;
  if (stringEntered!.length < AppConstants.minPasswordLength) {
    return S.of(context).errorMinNumberCharacters(AppConstants.minPasswordLength);
  }
  return null;
}

String? validateConfirmPassword(
  String stringEntered,
  String otherPassword,
  BuildContext context,
) {
  final notPassword = validatePassword(stringEntered, context);
  if (notPassword != null) return notPassword;
  if (stringEntered != otherPassword) {
    return S.of(context).errorPasswordNotIdentical;
  }
  return null;
}
