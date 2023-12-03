part of 'signout_bloc.dart';

@immutable
sealed class SignoutState {}

final class SignoutInitial extends SignoutState {}

final class SignoutLoading extends SignoutState {}

final class SignoutSuccess extends SignoutState {}

final class SignoutError extends SignoutState {
  final String? error;
  SignoutError(this.error);
}
