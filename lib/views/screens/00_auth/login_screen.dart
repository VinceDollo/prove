import 'package:flutter/material.dart';
import 'package:flutter_starter/views/components/custom_button_widget.dart';
import 'package:flutter_starter/views/components/custom_text_form_field.dart';
import 'package:flutter_starter/views/components/tap_to_close_keyboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapToCloseKeyboard(
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                readOnly: true,
                controller: emailController,
                labelText: 'Email',
                hintText: 'Votre email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: passwordController,
                labelText: 'Mot de passe',
                hintText: 'Votre mot de passe',
                isPassword: true,
              ),
              const SizedBox(height: 50),
              CustomButtonWidget.filled(
                isLoading: false,
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                },
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
