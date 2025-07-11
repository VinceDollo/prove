import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/ws/ws_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod()
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<BearerToken?> build() async {
    return null;
  }

  Future<void> logUserIn() async {
    state = const AsyncLoading();
    final res = await login(email: 'email', password: 'password');
    if (res.isSuccess && res is BearerToken) {
      state = AsyncData(res.data);
    } else {
      state = AsyncError(res.getErrorMessage('erreur'), StackTrace.current);
    }
  }

  Future<void> logUserOut() async {
    state = const AsyncData(null);
  }
}
