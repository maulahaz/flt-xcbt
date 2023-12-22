part of 'exam_by_categ_bloc.dart';

sealed class ExamByCategEvent {}

final class GetExamByCateg extends ExamByCategEvent {
  final String category;

  GetExamByCateg(this.category);
}
