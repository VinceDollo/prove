import 'package:flutter_starter/model/api/response/customer.dart';
import 'package:flutter_starter/ws/ws_customer.dart';
import 'package:flutter_starter/ws/ws_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider((ref) => UserNotifier());

class UserNotifier extends StateNotifier<Customer?> {
  UserNotifier() : super(null);

  Future<void> logUserIn(String email, String password) async {
    // ignore: unused_local_variable
    final result = await login(email, password);
    if (result != null) state = await getCustomerProfile();
  }

  void logUserOut() => state = null;
}
