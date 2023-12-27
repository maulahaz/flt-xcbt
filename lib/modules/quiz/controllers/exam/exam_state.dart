part of 'exam_bloc.dart';

@immutable
sealed class ExamState {}

final class ExamInitialState extends ExamState {}

final class GetExamResultState extends ExamState {
  final String result;

  GetExamResultState({required this.result});
}

final class ExamLoadingState extends ExamState {}

final class PostExamResultState extends ExamState {}

final class ExamErrorState extends ExamState {
  final String? error;
  ExamErrorState(this.error);
}
