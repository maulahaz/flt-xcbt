import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcbt/modules/authorization/x_authorizations.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<GetSignup>(_handleSignup);
    // on<SignupEvent>((event, emit) async {
    //   print('--- Here:');
    //   print(event.toString());
    //   if (event is GetSignup) {
    //     String value = validation(event);
    //     print(value.toString());
    //     if (value != '') {
    //       emit(SignupValidation(value));
    //     } else {
    //       emit(SignupLoading());
    //       // await
    //       await AuthorizationService.register(event).then((val) {
    //         // SharedPreferences prefs = await SharedPreferences.getInstance();
    //         // prefs.setString('email', "${event.email}");
    //         // prefs.setString('password', "${event.password}");
    //         emit(SignupLoaded(result: val));
    //       }).onError((error, stackTrace) {
    //         emit(SignupError(error.toString()));
    //       });
    //       //
    //       // await Future.delayed(Duration(seconds: 2), () async {
    //       //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //       //   prefs.setString('email', "${event.email}");
    //       //   prefs.setString('password', "${event.password}");
    //       //   emit(SignupLoaded());
    //       // }).onError((error, stackTrace) {
    //       //   emit(SignupError(error.toString()));
    //       // });
    //     }
    //   }
    // });
  }

  Future<void> _handleSignup(GetSignup event, Emitter<SignupState> emit) async {
    String value = validation(event);
    if (value != '') {
      emit(SignupValidation(value));
    } else {
      emit(SignupLoading());
      print('---event');
      Map<String, dynamic> dataRequest = {
        'name': event.fullname,
        'email': event.email,
        'password': event.password,
      };
      final response =
          await AuthorizationService.register(dataRequest); //.then((val) {
      response.fold(
        (L) => emit(SignupError(L)),
        (R) => emit(SignupLoaded(result: R)),
      );
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('email', "${event.email}");
      // prefs.setString('password', "${event.password}");
      // emit(SignupLoaded(result: val));
      // }).onError((error, stackTrace) {
      //   emit(SignupError(error.toString()));
      // });
    }
  }
}

//--validation for text field
String validation(GetSignup data) {
  if (data.fullname?.isEmpty == true) {
    return 'Please Enter Your Fullname';
  }
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email-id';
  }
  if (data.phoneNumber?.isEmpty == true) {
    return 'Please Enter Your Phone Number';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  return '';
}
