import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/widgets/all_widgets.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(Icons.coffee_sharp,size: 40.0),
          const SizedBox(height: 14.0),
          const Text(
            'Sign up successful!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: const Text(
        'Your account has been created. Please wait a moment, we are preparing for you...',
      ),
      actions: [
        Button.filled(
          onPressed: () {},
          label: 'Redirecting...',
          icon: const SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: kWhite,
              strokeWidth: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}