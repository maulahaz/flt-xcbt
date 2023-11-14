part of 'person_bloc.dart';

@immutable
sealed class PersonEvent {}

class LoadPersonEvent extends PersonEvent {
  final PersonModel person;

  LoadPersonEvent({required this.person});
}

class AddPerson extends PersonEvent {
  final PersonModel person;

  AddPerson({required this.person});
}

class DeletePerson extends PersonEvent {
  final PersonModel person;

  DeletePerson({required this.person});
}

class UpdatePerson extends PersonEvent {
  final PersonModel person;

  UpdatePerson({required this.person});
}
