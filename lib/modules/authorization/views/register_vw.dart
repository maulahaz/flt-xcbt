import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/extensions/x_extensions.dart';
import 'package:xcbt/modules/home/x_homes.dart';

import 'package:xcbt/widgets/all_widgets.dart';

import '../x_authorizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //--controller for text field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppPrimary,
        title: const Text('Register'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          MyTextField(
            controller: nameController,
            label: 'Fullname',
          ),
          const SizedBox(height: 16.0),
          MyTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          const SizedBox(height: 16.0),
          MyTextField(
            controller: phoneController,
            label: 'Phone Number',
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
          BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
            if (state is SignupLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SignupValidation) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${state.value}"),
                  backgroundColor: kRed,
                ),
              );
            }
            if (state is SignupLoaded) {
              // AuthLocalDatasource().saveAuthData(state);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('New User Successfully Registered'),
                  backgroundColor: Colors.green,
                ),
              );
              context.pushReplacement(const DashboardView());
            }
            ;
          }, builder: (context, state) {
            return Button.filled(
                onPressed: () {
                  // Map<String, dynamic> dataRequest = {
                  //   'fullname': nameController.text,
                  //   'email': emailController.text,
                  //   'phoneNumber': phoneController.text,
                  //   'password': passwordController.text,
                  // };
                  context.read<SignupBloc>().add(GetSignup(
                        fullname: nameController.text,
                        email: emailController.text,
                        phoneNumber: phoneController.text,
                        password: passwordController.text,
                      ));
                  // Future.delayed(
                  //   const Duration(seconds: 2),
                  //   () => context.pushReplacement(const LoginView()),
                  // );
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return const RegisterSuccessDialog();
                  //   },
                  // );
                },
                label: 'REGISTER',
              );
            
            // if (state is SignupInitial) {
            //   return Button.filled(
            //     onPressed: () {},
            //     label: 'Register',
            //   );
            // } else {
            //   return Container();
            // }
          }),
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
