import 'package:flutter_starter/app/app_flavor.dart';
import 'package:flutter_starter/utils/instance_get_it.dart';

// ignore: constant_identifier_names
const String API_USER_ID = 'me';

// keys
class ApiKeys {
  static const String currentPassword = 'currentPassword';
  static const String newPassword = 'newPassword';
}

enum Api {
  customerRegister,
  customerProfile,
  customerUpdatePassword,
  customerRequestPassword,
  customerResetPassword,
  login,
  pets,
  pet,
}

extension ApiExtension on Api {
  String apiEndpoint({List<String>? arguments}) {
    final baseApiUrl = instanceGetIt<AppFlavor>().baseUrl;
    switch (this) {
      case Api.customerRegister:
        return '$baseApiUrl/api/customers/register';
      case Api.customerProfile:
        return '$baseApiUrl/api/customers/$API_USER_ID';
      case Api.customerUpdatePassword:
        return '$baseApiUrl/api/customers/$API_USER_ID/password';
      case Api.customerRequestPassword:
        return '$baseApiUrl/api/request-password';
      case Api.customerResetPassword:
        return '$baseApiUrl/api/reset-password/{${arguments?[0]}}';
      case Api.login:
        return '$baseApiUrl/api/oauth/v2/token';
      case Api.pets:
        return '$baseApiUrl/api/pets';
      case Api.pet:
        return '$baseApiUrl${arguments?[0]}';
    }
  }
}
