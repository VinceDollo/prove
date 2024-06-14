import 'package:flutter/material.dart';
import 'package:flutter_starter/views/components/custom_text_form_field.dart';
import 'package:flutter_starter/views/components/tap_to_close_keyboard.dart';
import 'package:flutter_starter/views/viewmodel/00_auth/login_viewmodel.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen(this._loginViewModel, {Key? key}) : super(key: key);
  static const String routeName = 'login';

  final ILoginViewModel _loginViewModel;

  @override
  Widget build(BuildContext context) {
    return TapToCloseKeyboard(
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedBuilder(
            animation: _loginViewModel,
            builder: (context, snapshot) {
              final isLoading = _loginViewModel.isLoading;
              return Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    onChanged: _onEmailChange,
                    errorText: _loginViewModel.emailErrorMessage,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    onChanged: _onPasswordChange,
                    errorText: _loginViewModel.passwordErrorMessage,
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      await _onClickLogin(context);
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onClickLogin(BuildContext context) async {
    await _loginViewModel.loginUser();
    if (_loginViewModel.user != null) {
      if (context.mounted) {
        context.goNamed('screen1');
      }
    }
  }

  void _onEmailChange(String? email) {
    _loginViewModel.emailChanged(email);
  }

  void _onPasswordChange(String? password) {
    _loginViewModel.passwordChanged(password);
  }
}
