import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../x_authorizations.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({
    super.key,
  });

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<SignoutBloc>().add(GetSignout());
            // AuthorizationService.removeAuthData();
            context.pushReplacement(const LoginView());
          },
          child: const Text('Logout')),
    );
  }
}