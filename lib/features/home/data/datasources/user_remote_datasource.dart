import 'dart:async';

import 'package:flutter_starter/core/network/api_endpoints.dart';
import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/core/network/client/base_client.dart';
import 'package:flutter_starter/features/home/data/models/user_dto.dart';

class UserRemoteDataSource {
  UserRemoteDataSource({required BaseClient client}) : _client = client;

  final BaseClient _client;

  Future<ApiResult<UserDto?>> fetchUser() async {
    final result = await _client.get(Api.me.apiEndpoint());
    if (result.isSuccess && result.data is Map<String, dynamic>) {
      final user = UserDto.fromJson(result.data! as Map<String, dynamic>);
      return ApiResult.success(user);
    } else {
      return ApiResult.error(result.error!);
    }
  }
}
