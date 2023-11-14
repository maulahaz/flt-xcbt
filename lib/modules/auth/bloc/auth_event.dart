part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

//--BOF-----------------------------------------------------------------------------
class EmailEvent extends AuthEvent {
  final String email;

  EmailEvent({required this.email});
}

//--BOF-----------------------------------------------------------------------------
class PasswordEvent extends AuthEvent {
  final String password;

  PasswordEvent({required this.password});
}

//--BOF-----------------------------------------------------------------------------
class SiginRequestedEvent extends AuthEvent {
  final String email, password;

  SiginRequestedEvent({required this.email, required this.password});
}

//--BOF-----------------------------------------------------------------------------
class SigupRequestedEvent extends AuthEvent {
  final String email, password;

  SigupRequestedEvent({required this.email, required this.password});
}
