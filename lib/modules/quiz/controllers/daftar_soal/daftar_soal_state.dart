part of 'daftar_soal_bloc.dart';

sealed class DaftarSoalState {}

final class DaftarSoalInitial extends DaftarSoalState {}

final class DaftarSoalLoading extends DaftarSoalState {}

final class DaftarSoalEmpty extends DaftarSoalState {}

final class DaftarSoalSuccess extends DaftarSoalState {
  final List<Question> data;
  final int index;
  final bool isNext;
  DaftarSoalSuccess(this.data, this.index, this.isNext);
}

final class DaftarSoalError extends DaftarSoalState {
  final String? error;
  DaftarSoalError(this.error);
}
