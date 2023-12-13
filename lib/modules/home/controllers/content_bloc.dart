import 'package:flutter_bloc/flutter_bloc.dart';

import '../x_homes.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentInitial()) {
    on<GetContent>(_handleContent);
  }

  Future<void> _handleContent(event, emit) async {
    emit(ContentLoading());
  }
}
