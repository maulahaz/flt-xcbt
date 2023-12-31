import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../x_quizes.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitialState()) {
    on<GetExamResultByCategory>(_getExamResultByCategory);
    on<GetExamResult>(_getExamResult);
    on<PostExamAnswer>(_postExamAnswer);
  }

  Future<void> _getExamResultByCategory(event, emit) async {
    emit(ExamLoadingState());
    final response = await QuizService.getExamResultByCategory(event.category);
    response.fold((L) => emit(ExamErrorState(L)),
        (R) => emit(GetExamResultByCategoryState(result: R)));
  }

  Future<void> _postExamAnswer(event, emit) async {
    emit(ExamLoadingState());
    final response = await QuizService.postExamAnswer(
        event.soalId, event.answer, event.category);
    response.fold(
        (L) => emit(ExamErrorState(L)), (R) => emit(PostExamResultState()));
  }

  Future<void> _getExamResult(event, emit) async {
    emit(ExamLoadingState());
    final response = await QuizService.getExamResult();
    response.fold((L) => emit(ExamErrorState(L)),
        (R) => emit(GetExamResultState(result: R)));
  }
}
