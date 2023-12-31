import 'package:flutter_bloc/flutter_bloc.dart';

import '../../x_quizes.dart';

part 'exam_by_categ_event.dart';
part 'exam_by_categ_state.dart';

class ExamByCategBloc extends Bloc<ExamByCategEvent, ExamByCategState> {
  ExamByCategBloc() : super(ExamByCategInitial()) {
    on<GetExamByCateg>(_handleGetExamByCateg);
  }

  Future<void> _handleGetExamByCateg(event, emit) async {
    emit(ExamByCategLoading());
    // final response = await QuizService.getExamByCateg(event.category);
    final response = await QuizService.getExamQuestionByCateg(event.category);
    response.fold((L) => emit(ExamByCategError(L)), (R) {
      if (R.data.isEmpty) {
        emit(ExamByCategEmpty());
      } else {
        emit(ExamByCategSuccess(result: R));
      }
    });
  }
}
