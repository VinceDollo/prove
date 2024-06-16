import 'package:flutter/material.dart';
import 'package:flutter_starter/views/components/custom_text_form_field.dart';
import 'package:flutter_starter/views/components/tap_to_close_keyboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login';

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
              const CustomTextFormField(),
              const SizedBox(height: 20),
              const CustomTextFormField(),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
