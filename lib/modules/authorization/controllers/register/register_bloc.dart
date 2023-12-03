import 'package:bloc/bloc.dart';
import 'package:xcbt/modules/authorization/x_authorizations.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    // on<RegisterRequested>(_handleRegisterRequested);
    // on<RegisterAddedToCart>(_handleRegisterAddedToCart);
    // on<RegisterRemovedFromCart>(_handleRegisterRemovedFromCart);
  }
}