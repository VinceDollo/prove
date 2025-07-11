import 'dart:async';

import 'package:flutter_starter/managers/shared_preferences.dart';
import 'package:flutter_starter/model/api/api_result.dart';
import 'package:flutter_starter/model/api/response/user.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/ws/api.dart';
import 'package:flutter_starter/ws/client/authorized_client.dart';

Future<void> clearUser() async {
  logger.t('Clear user information');
  await cleanBearerToken();
  // await unregisterToken();
}

Future<ApiResult> fetchUser() async {
  final result = await AuthorizedClient().get(Api.me.apiEndpoint());
  if (result.isSuccess && result.data is Map<String, dynamic>) {
    try {
      final user = User.fromJson(result.data! as Map<String, dynamic>);
      return ApiResult.success(user);
    } catch (e) {
      logger.e('Error parsing BrandsResponse: $e');
      return ApiResult.error(Exception(e.toString()));
    }
  } else {
    return ApiResult.error(result.error!);
  }
}
