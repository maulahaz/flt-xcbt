part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class Loading extends AuthState {}

final class Authenticated extends AuthState {}

final class UnAuthenticated extends AuthState {}

final class SigninState extends AuthState {}

final class SiginRequestedState extends AuthState {}

final class AuthLoadedState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
