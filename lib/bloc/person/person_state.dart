part of 'person_bloc.dart';

@immutable
sealed class PersonState {
  final List<PersonModel> person;

  PersonState({required this.person});
}

final class PersonInitial extends PersonState {
  PersonInitial({required List<PersonModel> person}):super(person: person);
}

final class PersonLoadingState extends PersonState {
  PersonLoadingState({required List<PersonModel> person}):super(person: person);
}

final class PersonUpdateState extends PersonState {
  PersonUpdateState({required List<PersonModel> person}):super(person: person);
}
