part of 'content_bloc.dart';

sealed class ContentState {}

final class ContentInitial extends ContentState {}

final class ContentLoading extends ContentState {}

final class ContentSuccess extends ContentState {
  final ContentModel result;

  ContentSuccess({required this.result});
}

final class ContentError extends ContentState {
  final String? error;
  ContentError(this.error);
}
