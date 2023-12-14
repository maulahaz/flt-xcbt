part of 'content_bloc.dart';

sealed class ContentEvent {}

final class GetContentById extends ContentEvent {
  final String id;

  GetContentById(this.id);
}
