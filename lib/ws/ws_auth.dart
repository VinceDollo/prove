import 'dart:async';

import 'package:flutter_starter/managers/shared_preferences.dart';
import 'package:flutter_starter/model/api/api_result.dart';
import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/values/constants.dart';
import 'package:flutter_starter/ws/api.dart';
import 'package:flutter_starter/ws/client/authorized_client.dart';
import 'package:flutter_starter/ws/ws_user.dart';

Future<ApiResult<BearerToken?>> login({
  required String email,
  required String password,
}) async {
  final body = <String, String>{
    AppConstants.email: email,
    AppConstants.password: password,
  };
  final result = await AuthorizedClient().post(Api.login.apiEndpoint(), body: body);
  if (result.isSuccess && result.data is Map<String, dynamic>) {
    try {
      final token = BearerToken.fromJson(result.data! as Map<String, dynamic>);
      await saveBearerToken(token);
      return ApiResult.success(token);
    } catch (e) {
      logger.e('Error parsing BearerToken: $e');
      return ApiResult.error(Exception(e.toString()));
    }
  } else {
    return ApiResult.error(result.error!);
  }
}


Future<ApiResult<BearerToken?>> refreshToken({
  bool redirectOnLogin = true,
}) async {
  final token = await loadBearerToken();
  final refreshToken = token?.refreshToken;

  if (refreshToken == null) {
    await clearUser();
    return ApiResult.error(Exception());
  } else {
    final body = <String, String>{
      AppConstants.refreshToken: refreshToken,
    };

    final result = await AuthorizedClient().post(
      Api.authRefreshToken.apiEndpoint(),
      body: body,
    );

    if (result.isSuccess && result.data != null && result.data is Map<String, dynamic>) {
      try {
        final token = BearerToken.fromJson(result.data! as Map<String, dynamic>);
        await saveBearerToken(token);
        return ApiResult.success(token);
      } catch (e) {
        await clearUser();
        return ApiResult.error(Exception());
      }
    } else {
      await clearUser();
      return ApiResult.error(result.error!);
    }
  }
}
