import 'package:flutter_bloc/flutter_bloc.dart';

import '../../x_quizes.dart';

part 'daftar_soal_event.dart';
part 'daftar_soal_state.dart';

class DaftarSoalBloc extends Bloc<DaftarSoalEvent, DaftarSoalState> {
  DaftarSoalBloc() : super(DaftarSoalInitial()) {
    on<GetDaftarSoal>(_getDaftarSoal);
    on<NextDaftarSoal>(_nextDaftarSoal);
  }

  Future<void> _getDaftarSoal(event, emit) async {
    emit(DaftarSoalLoading());
    emit(DaftarSoalSuccess(
      event.data,
      0,
      event.data.length > 1,
    ));
  }

  Future<void> _nextDaftarSoal(event, emit) async {
    final curState = state as DaftarSoalSuccess;
    // final curState = DaftarSoalSuccess(event.data, 0, event.data.length > 1);
    emit(DaftarSoalSuccess(
      curState.data,
      curState.index + 1,
      curState.data.length > curState.index + 2,
    ));
  }
}
