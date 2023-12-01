import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/extensions/x_extensions.dart';
import 'package:xcbt/widgets/all_widgets.dart';

import '../../home/x_homes.dart';
import '../x_authorizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log in'),
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
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kAppPrimary,
              ),
            ),
          ),
          const SizedBox(height: 42.0),
          Button.filled(
            onPressed: () {
              context.pushReplacement(const DashboardView());
            },
            label: 'LOG IN',
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              context.pushReplacement(const RegisterView());
            },
            child: const Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                children: [
                  TextSpan(
                    text: 'Sign up',
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