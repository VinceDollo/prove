import 'package:flutter_starter/core/network/client/authorized_client.dart';
import 'package:flutter_starter/core/network/client/unauthorized_client.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';
import 'package:flutter_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_starter/features/home/data/datasources/user_remote_datasource.dart';
import 'package:flutter_starter/features/home/data/repositories/user_repository_impl.dart';
import 'package:flutter_starter/features/home/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

GetIt instanceGetIt = GetIt.instance;

void setupGetIt() {
  // --- Core: Network clients ---
  instanceGetIt
    ..registerLazySingleton<UnauthorizedClient>(UnauthorizedClient.new)
    ..registerLazySingleton<AuthLocalDataSource>(AuthLocalDataSource.new);

  // AuthRemoteDataSource uses UnauthorizedClient (login doesn't need auth)
  instanceGetIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(client: instanceGetIt<UnauthorizedClient>()),
  );

  // AuthRepository needs remote + local datasources
  instanceGetIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: instanceGetIt<AuthRemoteDataSource>(),
      localDataSource: instanceGetIt<AuthLocalDataSource>(),
    ),
  );

  // AuthorizedClient needs token access via auth layer
  instanceGetIt.registerLazySingleton<AuthorizedClient>(
    () => AuthorizedClient(
      getAuthorizationHeader: () async {
        final token = await instanceGetIt<AuthLocalDataSource>().loadBearerToken();
        return token?.header;
      },
      refreshToken: () async {
        final result = await instanceGetIt<AuthRepository>().refreshToken();
        return result.isSuccess && result.data is BearerTokenDto;
      },
    ),
  );

  // --- Feature: Home ---
  instanceGetIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(client: instanceGetIt<AuthorizedClient>()),
  );

  instanceGetIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: instanceGetIt<UserRemoteDataSource>(),
      authLocalDataSource: instanceGetIt<AuthLocalDataSource>(),
    ),
  );
}
