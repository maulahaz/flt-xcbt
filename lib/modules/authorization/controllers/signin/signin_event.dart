part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class GetSignin extends SigninEvent {
  final String? email;
  final String? password;
  GetSignin({required this.email, required this.password});
}
