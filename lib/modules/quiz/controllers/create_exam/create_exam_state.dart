part of 'create_exam_bloc.dart';

@immutable
sealed class CreateExamState {}

final class CreateExamInitial extends CreateExamState {}

final class CreateExamLoading extends CreateExamState {}

final class CreateExamSuccess extends CreateExamState {}

final class CreateExamError extends CreateExamState {
  final String? error;
  CreateExamError(this.error);
}
