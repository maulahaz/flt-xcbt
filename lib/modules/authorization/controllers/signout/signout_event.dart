part of 'signout_bloc.dart';

@immutable
sealed class SignoutEvent {}

class GetSignout extends SignoutEvent {}