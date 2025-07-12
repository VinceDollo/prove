import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/providers/auth_notifier.dart';
import 'package:flutter_starter/utils/snack_bar_utils.dart';
import 'package:flutter_starter/utils/validator.dart';
import 'package:flutter_starter/views/components/custom_button_widget.dart';
import 'package:flutter_starter/views/components/custom_text_form_field.dart';
import 'package:flutter_starter/views/components/tap_to_close_keyboard.dart';
import 'package:flutter_starter/views/screens/01_home/home_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authNotifierProvider.select((s) => s.isLoading));

    ref.listen<AsyncValue<BearerToken?>>(
      authNotifierProvider,
      (previous, next) {
        if (next.hasError) {
          final error = next.error;
          if (error != null) {
            showSnackBar(context, error.toString());
            ref.read(authNotifierProvider.notifier).clearError();
          }
          return;
        }

        if (next is AsyncData<BearerToken?>) {
          final token = next.value;
          if (token != null) {
            context.replaceNamed(Screen1.routeName);
          }
        }
      },
    );

    return PopScope(
      canPop: !isLoading,
      child: TapToCloseKeyboard(
        child: Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      readOnly: isLoading,
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'Votre email',
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 100,
                      validator: (value) => validateEmail(value, context),
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      readOnly: isLoading,
                      controller: _passwordController,
                      labelText: 'Mot de passe',
                      hintText: 'Votre mot de passe',
                      isPassword: true,
                      maxLength: 100,
                      validator: (value) => validatePassword(value, context),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 50),
                    CustomButtonWidget.filled(
                      isLoading: isLoading,
                      onPressed: _onPressed,
                      text: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      await authNotifier.logUserIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }
}
