import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/core/utils/app_logger.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_starter/features/home/data/datasources/user_remote_datasource.dart';
import 'package:flutter_starter/features/home/data/models/user_dto.dart';
import 'package:flutter_starter/features/home/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserRemoteDataSource remoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  final UserRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<ApiResult<UserDto?>> fetchUser() async {
    try {
      return await _remoteDataSource.fetchUser();
    } catch (e) {
      logger.e('Error fetching user: $e');
      return ApiResult.error(Exception(e.toString()));
    }
  }

  @override
  Future<void> clearUser() async {
    logger.t('Clear user information');
    await _authLocalDataSource.clearBearerToken();
  }
}
