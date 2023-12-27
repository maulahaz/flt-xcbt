part of 'exam_bloc.dart';

@immutable
sealed class ExamEvent {}

final class GetExamResult extends ExamEvent {
  final String category;

  GetExamResult(this.category);
}

final class PostExamAnswer extends ExamEvent {
  final int soalId;
  final String answer;

  PostExamAnswer({required this.soalId, required this.answer});
}
