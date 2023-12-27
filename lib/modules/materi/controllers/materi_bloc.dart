import 'package:flutter_bloc/flutter_bloc.dart';

import '../x_materis.dart';

part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  MateriBloc() : super(MateriInitial()) {
    on<GetAllMateri>(_handleGetAllMateri);
  }

  Future<void> _handleGetAllMateri(event, emit) async {
    emit(MateriLoading());
    final response = await MateriService.getAllMateri();
    response.fold(
      (L) => emit(MateriError(L)),
      (R) => emit(MateriSuccess(result: R)),
    );
  }
}
