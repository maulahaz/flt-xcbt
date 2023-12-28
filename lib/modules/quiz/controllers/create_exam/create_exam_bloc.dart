import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../x_quizes.dart';

part 'create_exam_event.dart';
part 'create_exam_state.dart';

class CreateExamBloc extends Bloc<CreateExamEvent, CreateExamState> {
  CreateExamBloc() : super(CreateExamInitial()) {
    on<CreateExam>(_createExam);
    on<CreateExamByCategory>(_createExamByCategory);
  }

  Future<void> _createExam(event, emit) async {
    emit(CreateExamLoading());
    final response = await QuizService.createExam();
    response.fold(
      (L) => emit(CreateExamError(L)),
      (R) => emit(CreateExamSuccess()),
    );
  }

  Future<void> _createExamByCategory(event, emit) async {
    emit(CreateExamLoading());
    final response = await QuizService.createExamByCategory(event.category);
    response.fold(
      (L) => emit(CreateExamError(L)),
      (R) => emit(CreateExamSuccess()),
    );
  }
}
