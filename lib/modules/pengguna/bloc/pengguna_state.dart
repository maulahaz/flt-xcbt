part of 'pengguna_bloc.dart';

@immutable
sealed class PenggunaState {}

final class PenggunaInitialState extends PenggunaState {}

final class PenggunaLoadingState extends PenggunaState {}

final class PenggunaLoadedState extends PenggunaState {
  // final PenggunaModel data;
  // PenggunaLoadedState({required this.data});
  final List<DataPengguna> data;
  PenggunaLoadedState({required this.data});
}

final class PenggunaErrorState extends PenggunaState {
  final String error;
  PenggunaErrorState(this.error);
}
