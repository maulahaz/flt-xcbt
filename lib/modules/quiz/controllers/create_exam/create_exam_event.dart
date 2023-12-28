part of 'create_exam_bloc.dart';

@immutable
sealed class CreateExamEvent {}

final class CreateExam extends CreateExamEvent {}

final class CreateExamByCategory extends CreateExamEvent {
  final String category;

  CreateExamByCategory({required this.category});
}
