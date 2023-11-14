import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/modules/auth/all_auth.dart';
// import 'package:xcbt/pages/home.dart';

import 'modules/frontpage/views/dashboard_vw.dart';
// import 'package:xcbt/modules/product/views/product_app_vw.dart';
// import 'package:xcbt/modules/pengguna/views/pengguna_app_vw.dart';

void main() {
  runApp(const MyApp());
  // runApp(const ProductApp());
  // runApp(const PenggunaApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const Home(),
        // home: SigninView(),
        home: DashboardView(),
      ),
    );
  }
}
