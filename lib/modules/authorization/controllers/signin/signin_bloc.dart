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
    String value = validateLogin(event);
    if (value != '') {
      emit(SigninValidation(value));
    } else {
      emit(SigninLoading());
      Map<String, String> loginData = {
        'email': event.email,
        'password': event.password,
      };
      final response = await AuthorizationService.login(loginData);
      response.fold(
        (L) => emit(SigninError(L)),
        (R) => emit(SigninSuccess(result: R)),
      );
    }
  }
}

//--validation for text field
String validateLogin(GetSignin data) {
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email ID';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  return '';
}
