part of 'exam_bloc.dart';

@immutable
sealed class ExamState {}

final class ExamInitialState extends ExamState {}

final class ExamLoadingState extends ExamState {}

final class GetExamResultByCategoryState extends ExamState {
  final String result;

  GetExamResultByCategoryState({required this.result});
}

final class GetExamResultState extends ExamState {
  final ExamResultModel result;

  GetExamResultState({required this.result});
}

final class PostExamResultState extends ExamState {}

final class ExamErrorState extends ExamState {
  final String? error;
  ExamErrorState(this.error);
}
