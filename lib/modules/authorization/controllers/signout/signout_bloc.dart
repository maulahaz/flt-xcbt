import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcbt/modules/authorization/x_authorizations.dart';

part 'signout_event.dart';
part 'signout_state.dart';

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(SignoutInitial()) {
    // on<SignoutEvent>((event, emit) {});
    on<GetSignout>(_handleSignout);
  }

  Future<void> _handleSignout(event, emit) async {
    emit(SignoutLoading());
    // await AuthorizationService.removeAuthData();
    final response = await AuthorizationService.logout();
    response.fold(
      (L) => emit(SignoutError(L)),
      (R) => emit(SignoutSuccess()),
    );

  }
}
