import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/content_srv.dart';
import '../x_contents.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentInitial()) {
    on<GetContentById>(_handleGetContentById);
  }

  Future<void> _handleGetContentById(event, emit) async {
    emit(ContentLoading());
    final response = await ContentService.getContentById(event.id);
    print('==>response');
    print(response);
    response.fold(
      (L) => emit(ContentError(L)),
      (R) => emit(ContentSuccess(result: R)),
    );
  }
}
