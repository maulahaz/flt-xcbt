part of 'daftar_soal_bloc.dart';

sealed class DaftarSoalEvent {}

final class GetDaftarSoal extends DaftarSoalEvent {
  final List<Question> data;
  GetDaftarSoal(this.data);
}

final class NextDaftarSoal extends DaftarSoalEvent {}
