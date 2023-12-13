import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        backgroundColor: kAppPrimary,
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
          // Button.filled(
          //   onPressed: () {
          //     context.pushReplacement(const DashboardView());
          //   },
          //   label: 'LOG IN',
          // ),
          BlocConsumer<SigninBloc, SigninState>(listener: (context, state) {
            if (state is SigninLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SigninValidation) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${state.value}"), backgroundColor: kRed),
              );
            }
            if (state is SigninError) {
              print('Signin error');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${state.error}"), backgroundColor: kRed),
              );
            }
            if (state is SigninSuccess) {
              //simpan data ke local storage
              AuthorizationService.saveAuthData(state.result);
              //
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Welcome back. \nSignin accepted'),
                backgroundColor: Colors.green,
              ));
              context.pushReplacement(DashboardView());
            }
            ;
          }, builder: (context, state) {
            return MyButtons.primary(context, 'Log In', () {
              // context.pushReplacement(DashboardPage());
              context.read<SigninBloc>().add(GetSignin(
                  email: emailController.text,
                  password: passwordController.text));
            });
          }),
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