part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

class SigninValidation extends SigninState {
  final String? value;
  SigninValidation(this.value);
}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final AuthorizationModel result;

  SigninSuccess({required this.result});
}

final class SigninError extends SigninState {
  final String? error;
  SigninError(this.error);
}
