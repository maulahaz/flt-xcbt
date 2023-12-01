import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/extensions/x_extensions.dart';
import 'package:xcbt/widgets/all_widgets.dart';

import '../x_authorizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          MyTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          const SizedBox(height: 16.0),
          MyTextField(
            controller: usernameController,
            label: 'Username',
          ),
          const SizedBox(height: 16.0),
          MyTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          MyTextField(
            controller: confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          Button.filled(
            onPressed: () {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginView()),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RegisterSuccessDialog();
                },
              );
            },
            label: 'REGISRER',
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              context.pushReplacement(const LoginView());
            },
            child: const Text.rich(
              TextSpan(
                text: 'Already have an account?? ',
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(color: kAppPrimary),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}