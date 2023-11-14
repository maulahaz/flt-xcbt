part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final List<UserModel> users;
  UserLoaded(this.users);
}

final class UserError extends UserState {
  final String error;
  UserError(this.error);
}
