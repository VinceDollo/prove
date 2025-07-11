import 'package:flutter_starter/app/app_flavor.dart';
import 'package:flutter_starter/utils/instance_get_it.dart';

enum Api {
  me,
  authRefreshToken,
  login,
}

extension ApiExtension on Api {
  String apiEndpoint({List<String>? arguments}) {
    final baseApiUrl = instanceGetIt<AppFlavor>().baseUrl;
    switch (this) {
      case Api.me:
        return '$baseApiUrl/api/me';
      case Api.authRefreshToken:
        return '$baseApiUrl/api/refresh';
      case Api.login:
        return '$baseApiUrl/api/oauth/v2/token';
    }
  }
}
