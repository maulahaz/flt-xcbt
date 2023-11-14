import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcbt/modules/auth/all_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuthenticated()) {
    on<SiginRequestedEvent>(_handleSiginRequestedEvent);

    on<SigupRequestedEvent>(_handleSigupRequestedEvent);

    // on<EmailEvent>(_handleEmailEvent);

    // on<PasswordEvent>(_handlePasswordEvent);
  }

//--BOF-----------------------------------------------------------------------------
  void _handleSiginRequestedEvent(event, emit) async {
    emit(Loading());
    try {
      Map data = {};
      data['username'] = event.email;
      data['userpass'] = event.password;
      print(data);
      var result = await AuthService.signin(data);
      print('_handleSiginRequestedEvent');
      print(result);
      print(result['error']);
      if (result['error'] == false) {
        // MySnackbar.success(event.context, 'Okey', 'Test');
        print('Snackbar');
        emit(Authenticated());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticated());
    }
  }

//--BOF-----------------------------------------------------------------------------
  void _handleSigupRequestedEvent(event, emit) async {
    emit(Loading());
    try {
      Map data = {};
      data['username'] = event.email;
      data['userpass'] = event.password;
      await AuthService.signup(data);
      emit(Authenticated());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticated());
    }
  }

//--BOF-----------------------------------------------------------------------------
  // void _handleEmailEvent(EmailEvent event, Emitter<SigninState> emit) {
  //   print('Email is ${event.email}');
  //   emit(state.copyWith(email: event.email));
  // }

//--BOF-----------------------------------------------------------------------------
  // void _handlePasswordEvent(PasswordEvent event, Emitter<SigninState> emit){
  //   print('Email is ${event.password}');
  //   emit(state.copyWith(password: event.password));
  // }
}
