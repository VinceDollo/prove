import 'dart:async';

import 'package:flutter_starter/managers/shared_preferences.dart';
import 'package:flutter_starter/model/api/response/bearer_token_response.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/values/constants.dart';
import 'package:flutter_starter/ws/api.dart';
import 'package:flutter_starter/ws/client/authorized_client.dart';
import 'package:flutter_starter/ws/client/unauthorized_client.dart';

Future<void> clearUser() async {
  logger.v('Clear user shared information');
  await cleanBearerToken();
}

Future<dynamic> login(
  String email,
  String password,
) async {
  final body = <String, String>{
    'grant_type': 'password',
    'username': email,
    'password': password,
  };

  return UnauthorizedClient()
      .post(Api.login.apiEndpoint(), body: body)
      .then((data) async {
    if (data is Map<String, dynamic>) {
      final token = BearerToken.fromJson(data);
      await saveBearerToken(token);
      return token;
    } else {
      return Future.error('Invalid password');
    }
  }).catchError((Object error) async {
    await clearUser();
    return Future.error(error);
  });
}

Future<dynamic> requestNewPassword(String email) {
  return UnauthorizedClient().post(
    Api.customerRequestPassword.apiEndpoint(),
    body: {
      'email': email,
    },
  );
}

Future<dynamic> resetPassword(
  String token,
  String newPassword,
) {
  return UnauthorizedClient().post(
    Api.customerResetPassword.apiEndpoint(arguments: [token]),
    body: {
      'password': newPassword,
    },
  );
}

Future<dynamic> updatePassword(
  String currentPassword,
  String newPassword,
) async {
  return AuthorizedClient().put(
    Api.customerUpdatePassword
        .apiEndpoint(arguments: [AppConstants.defaultApiId]),
    body: {
      ApiKeys.currentPassword: newPassword,
      ApiKeys.newPassword: newPassword,
    },
  );
}

Future<void> logout() async {
  await clearUser();
}

Future<dynamic> refreshToken({bool redirectOnLogin = true}) async {
  final token = await loadBearerToken();
  final refreshToken = token?.refreshToken;

  if (refreshToken == null) {
    await clearUser();
    // TODO
    // ignore: lines_longer_than_80_chars
    // instanceGetIt<NavigatorState>().pushReplacementNamed(LoginScreen.routeName);
  } else {
    final body = <String, String>{
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
    };

    return UnauthorizedClient()
        .post(Api.login.apiEndpoint(), body: body)
        .then((data) {
      if (data != null) {
        final token = BearerToken.fromJson(data as Map<String, dynamic>);
        saveBearerToken(token);
        return token;
      } else {
        return Future.error('Invalid password');
      }
    }).catchError((error) async {
      await clearUser();
      if (redirectOnLogin) {
        // TODO
        // ignore: lines_longer_than_80_chars
        // instanceGetIt<NavigatorState>().pushReplacementNamed(LoginScreen.routeName);
      }
    });
  }
}
