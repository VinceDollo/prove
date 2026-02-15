import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';

abstract interface class AuthRepository {
  Future<ApiResult<BearerTokenDto?>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<BearerTokenDto?>> refreshToken();

  Future<void> logout();
}
