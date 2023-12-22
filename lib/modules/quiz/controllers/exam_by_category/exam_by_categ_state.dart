part of 'exam_by_categ_bloc.dart';

sealed class ExamByCategState {}

final class ExamByCategInitial extends ExamByCategState {}

final class ExamByCategLoading extends ExamByCategState {}

final class ExamByCategSuccess extends ExamByCategState {
  final ExamModel result;

  ExamByCategSuccess({required this.result});
}

final class ExamByCategError extends ExamByCategState {
  final String? error;
  ExamByCategError(this.error);
}
