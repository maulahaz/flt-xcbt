import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/data/datasource/remote_datasource.dart';

import '../bloc/user_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(remoteDatasource: RemoteDatasource())..add(LoadUser()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Apps With BLOC and DIO'),
        ),
        body: Container(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                final data = state.users;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data[index].avatar)),
                        title: Text(
                            '${data[index].firstName} ${data[index].lastName}'),
                        subtitle: Text(data[index].email),
                      );
                    });
              } else if (state is UserError) {
                return Column(
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            print('Check');
                            // UserLoaded(state);
                          },
                          child: Text('Refresh')),
                    ),
                    Center(
                      child: Text(state.error),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
