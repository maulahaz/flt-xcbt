import 'package:bloc/bloc.dart';
import 'package:xcbt/modules/authorization/x_authorizations.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // on<LoginRequested>(_handleLoginRequested);
    // on<LoginAddedToCart>(_handleLoginAddedToCart);
    // on<LoginRemovedFromCart>(_handleLoginRemovedFromCart);
  }
}