import 'package:flutter_starter/model/api/response/user.dart';
import 'package:flutter_starter/ws/ws_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() async {
    return _fetchUser();
  }

  Future<User?> _fetchUser() async {
    final res = await fetchUser();
    if(res.isSuccess && res is User){
      return res.data! as User;
    }

    return null;
  }

  void logUserOut() {
    state = const AsyncValue.data(null);
  }
}
