import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/modules/pengguna/all_pengguna.dart';

class PenggunaApp extends StatelessWidget {
  const PenggunaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Pengguna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => PenggunaBloc(),
        child: PenggunaView(),
      ),
    );
  }
}


