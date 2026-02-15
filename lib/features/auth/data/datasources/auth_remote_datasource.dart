import 'dart:async';

import 'package:flutter_starter/core/network/api_endpoints.dart';
import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/core/network/client/base_client.dart';
import 'package:flutter_starter/core/values/constants.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({required BaseClient client}) : _client = client;

  final BaseClient _client;

  Future<ApiResult<BearerTokenDto?>> login({
    required String email,
    required String password,
  }) async {
    final body = <String, String>{
      AppConstants.email: email,
      AppConstants.password: password,
    };
    final result = await _client.post(Api.login.apiEndpoint(), body: body);
    if (result.isSuccess && result.data is Map<String, dynamic>) {
      final token = BearerTokenDto.fromJson(result.data! as Map<String, dynamic>);
      return ApiResult.success(token);
    } else {
      return ApiResult.error(result.error!);
    }
  }

  Future<ApiResult<BearerTokenDto?>> refreshToken({
    required String refreshToken,
  }) async {
    final body = <String, String>{
      AppConstants.refreshToken: refreshToken,
    };
    final result = await _client.post(
      Api.authRefreshToken.apiEndpoint(),
      body: body,
    );
    if (result.isSuccess && result.data is Map<String, dynamic>) {
      final token = BearerTokenDto.fromJson(result.data! as Map<String, dynamic>);
      return ApiResult.success(token);
    } else {
      return ApiResult.error(result.error!);
    }
  }
}
