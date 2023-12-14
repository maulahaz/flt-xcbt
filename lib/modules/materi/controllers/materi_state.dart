part of 'materi_bloc.dart';

sealed class MateriState {}

final class MateriInitial extends MateriState {}

final class MateriLoading extends MateriState {}

final class MateriSuccess extends MateriState {
  final MateriModel result;

  MateriSuccess({required this.result});
}

final class MateriError extends MateriState {
  final String? error;
  MateriError(this.error);
}
