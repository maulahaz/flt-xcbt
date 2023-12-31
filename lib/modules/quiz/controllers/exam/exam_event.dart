part of 'exam_bloc.dart';

@immutable
sealed class ExamEvent {}

final class GetExamResultByCategory extends ExamEvent {
  final String category;

  GetExamResultByCategory(this.category);
}

final class GetExamResult extends ExamEvent {}

final class PostExamAnswer extends ExamEvent {
  final int soalId;
  final String answer;
  final String category;

  PostExamAnswer(
      {required this.soalId, required this.answer, required this.category});
}
