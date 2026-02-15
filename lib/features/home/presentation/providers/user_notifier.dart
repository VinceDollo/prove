import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:flutter_starter/features/home/data/models/user_dto.dart';
import 'package:flutter_starter/features/home/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<UserDto?> build() async {
    return _fetchUser();
  }

  Future<UserDto?> _fetchUser() async {
    final repository = instanceGetIt<UserRepository>();
    final res = await repository.fetchUser();
    if (res.isSuccess && res.data is UserDto) {
      return res.data;
    }

    return null;
  }

  void logUserOut() {
    state = const AsyncValue.data(null);
  }
}
