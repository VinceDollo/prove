import 'package:flutter_starter/model/api/api_result.dart';
import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/ws/ws_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<BearerToken?> build() async {
    return null;
  }

  Future<void> logUserIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<BearerToken?>();

    await Future<void>.delayed(const Duration(seconds: 3));

    final res = ApiResult.success(
      BearerToken(accessToken: 'eeee', refreshToken: ''),
    );
    // final res = ApiResult.error(Exception());

    if (res.isSuccess && res.data is BearerToken) {
      state = AsyncData(res.data);
    } else {
      state = AsyncError<BearerToken?>(
        res.getErrorMessage('Une erreur est survenue'),
        StackTrace.current,
      );
    }
  }

  Future<void> logUserOut() async {
    state = const AsyncData(null);
  }

  void clearError() {
    if (state.hasError) {
      state = const AsyncData(null);
    }
  }
}
