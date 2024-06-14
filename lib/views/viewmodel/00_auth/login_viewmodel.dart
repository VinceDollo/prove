import 'package:flutter/cupertino.dart';

import 'package:flutter_starter/model/api/response/user.dart';

/// Pour des test
abstract class ILoginViewModel extends ChangeNotifier {
  String? get passwordErrorMessage;
  String? get emailErrorMessage;
  bool get isLoading;
  String? get loginErrorMessage;
  User? get user;
  void passwordChanged(String? newPassword);
  Future<void> loginUser();
  void emailChanged(String? newEmail);
}

class LoginViewModel extends ILoginViewModel {
  User? _user;
  bool _isLoading = false;

  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _loginErrorMessage;
  String? _email;
  String? _password;

  @override
  String? get passwordErrorMessage => _passwordErrorMessage;
  @override
  String? get emailErrorMessage => _emailErrorMessage;
  @override
  String? get loginErrorMessage => _loginErrorMessage;
  @override
  bool get isLoading => _isLoading;
  @override
  User? get user => _user;

  @override
  void emailChanged(String? newEmail) {
    _email = newEmail;
    _emailErrorMessage = null;
  }

  @override
  void passwordChanged(String? newPassword) {
    _password = newPassword;
    _passwordErrorMessage = null;
  }

  bool passwordAndEmailError() {
    return (_email == null || _email!.isEmpty) &&
        (_password == null || _password!.isEmpty);
  }

  @override
  Future<void> loginUser() async {
    final email = _email;
    final password = _password;

    if(passwordAndEmailError()){
      _emailErrorMessage = "Email vide";
      _passwordErrorMessage = "Password vide";
      notifyListeners();
      return;
    }

    if (email == null || email.isEmpty) {
      _emailErrorMessage = "Email vide";
      notifyListeners();
      return;
    }

    if (!email.contains("@")) {
      _emailErrorMessage = "Email invalide";
      notifyListeners();
      return;
    }

    if (password == null || password.isEmpty) {
      _passwordErrorMessage = "Password vide";
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    _user = User(12, 'vincent.dollo@hotmail.fr');
    _isLoading = false;
    notifyListeners();
  }
}
