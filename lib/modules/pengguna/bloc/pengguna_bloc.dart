import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcbt/modules/pengguna/all_pengguna.dart';

part 'pengguna_event.dart';
part 'pengguna_state.dart';

class PenggunaBloc extends Bloc<PenggunaEvent, PenggunaState> {

  PenggunaBloc() : super(PenggunaInitialState()) {
    on<PenggunaEvent>((event, emit) {});

    on<LoadPenggunaEven>(_handleLoadPenggunaEven);
  }

  Future<void> _handleLoadPenggunaEven(
      LoadPenggunaEven event, Emitter<PenggunaState> emit) async {
    emit(PenggunaLoadingState());
    await PenggunaService.getPengguna().then((val) {
      emit(PenggunaLoadedState(data: val));
    }).onError((error, stackTrace) {
      emit(PenggunaErrorState(error.toString()));
    });
  }
}
