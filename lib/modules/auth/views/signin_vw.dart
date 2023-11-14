import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/configs/colors.dart';
import 'package:xcbt/modules/auth/all_auth.dart';
import 'package:xcbt/widgets/all_widgets.dart';

class SigninView extends StatefulWidget {
  SigninView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

// final _formKey = GlobalKey<FormState>();

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtUser = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    // var size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          color: kWhite,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Pengguna'),
              ),
              backgroundColor: kWhite,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Center(
                      child: Text('Login with your Email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          FormInputText('Email', txtController: txtUser),
                          FormInputText('Password', txtController: txtPassword),
                          GradientButton(
                              title: 'Signin',
                              onTap: () {
                                print('Clicked: Signin');
                                MyIconSnackbar.success(context, 'Success', 'Data has been updated');
                                // context.read<AuthBloc>().add(
                                //     SiginRequestedEvent(
                                //         email: txtUser.text,
                                //         password: txtPassword.text));
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // void _checkLogin(BuildContext context) {
  //   if (_formKey.currentState!.validate) {
  //     context
  //         .read<AuthEvent>()
  //         .add(SigninRequestedEvent(email: txtUser, password: txtPassword));
  //   }
  // }
}
