import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../x_authorizations.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<GetSignin>(_handleSignin);
  }

  Future<void> _handleSignin(event, emit) async {
    emit(SigninLoading());
    // await AuthorizationService.removeAuthData();
    Map<String,String> data = {};
    final response = await AuthorizationService.login(data);
    response.fold(
      (L) => emit(SigninError(L)),
      (R) => emit(SigninSuccess()),
    );
  }
}
