import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcbt/modules/authorization/x_authorizations.dart';

part 'signout_event.dart';
part 'signout_state.dart';

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(SignoutInitial()) {
    on<SignoutEvent>((event, emit) {});
    on<GetSignout>(_handleSignout);
  }

  _handleSignout(GetSignout event, Emitter<SignoutState> emit) async {
    emit(SignoutLoading());
    // await AuthorizationService.removeAuthData();
    await AuthorizationService.logout().then((val) {
        emit(SignoutSuccess());
      }).onError((error, stackTrace) {
        emit(SignoutError(error.toString()));
      });
  }
}
