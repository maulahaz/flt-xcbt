part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupValidation extends SignupState {
  final String? value;
  SignupValidation(this.value);
}

class SignupLoading extends SignupState {}

final class SignupLoaded extends SignupState {
  final AuthorizationModel result;
  SignupLoaded({required this.result});
}

class SignupError extends SignupState {
  final String? error;
  SignupError(this.error);
}
