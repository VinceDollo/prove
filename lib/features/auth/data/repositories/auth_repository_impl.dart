import 'package:flutter_starter/core/network/api_result.dart';
import 'package:flutter_starter/core/utils/app_logger.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';
import 'package:flutter_starter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<ApiResult<BearerTokenDto?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      if (result.isSuccess && result.data != null) {
        await _localDataSource.saveBearerToken(result.data!);
      }
      return result;
    } catch (e) {
      logger.e('Error during login: $e');
      return ApiResult.error(Exception(e.toString()));
    }
  }

  @override
  Future<ApiResult<BearerTokenDto?>> refreshToken() async {
    final token = await _localDataSource.loadBearerToken();
    final refresh = token?.refreshToken;

    if (refresh == null) {
      await logout();
      return ApiResult.error(Exception('No refresh token available'));
    }

    try {
      final result = await _remoteDataSource.refreshToken(
        refreshToken: refresh,
      );
      if (result.isSuccess && result.data != null) {
        await _localDataSource.saveBearerToken(result.data!);
        return result;
      } else {
        await logout();
        return ApiResult.error(result.error ?? Exception('Token refresh failed'));
      }
    } catch (e) {
      await logout();
      return ApiResult.error(Exception(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    logger.t('Clearing user session');
    await _localDataSource.clearBearerToken();
  }
}
