import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/data/models/user_mdl.dart';

import '../data/datasource/remote_datasource.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDatasource remoteDatasource;

  UserBloc({required this.remoteDatasource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      print('UsrBloc-0');
      try {
        print('UsrBloc-1');
        // final result = await remoteDatasource.getUsers();
        final result = await remoteDatasource.fetchUsers();
        print('result.data---From UserBloc');
        print(result);
        emit(UserLoaded(result));
        print('UsrBloc-2');
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
