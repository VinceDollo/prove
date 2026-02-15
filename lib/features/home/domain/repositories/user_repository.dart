import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/features/home/data/models/user_dto.dart';

abstract interface class UserRepository {
  Future<ApiResult<UserDto?>> fetchUser();

  Future<void> clearUser();
}
