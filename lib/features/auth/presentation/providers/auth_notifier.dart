import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:flutter_starter/features/auth/data/models/bearer_token_dto.dart';
import 'package:flutter_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<BearerTokenDto?> build() async {
    return null;
  }

  Future<void> logUserIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<BearerTokenDto?>();

    final repository = instanceGetIt<AuthRepository>();
    final res = await repository.login(email: email, password: password);

    if (res.isSuccess && res.data is BearerTokenDto) {
      state = AsyncData(res.data);
    } else {
      state = AsyncError<BearerTokenDto?>(
        res.getErrorMessage('Une erreur est survenue'),
        StackTrace.current,
      );
    }
  }

  Future<void> logUserOut() async {
    final repository = instanceGetIt<AuthRepository>();
    await repository.logout();
    state = const AsyncData(null);
  }

  void clearError() {
    if (state.hasError) {
      state = const AsyncData(null);
    }
  }
}
