import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/modules/auth/all_auth.dart';

import 'modules/onboarding/x_onboardings.dart';
// import 'modules/car/x_cars.dart';
// import 'modules/frontpage/x_frontpage.dart';
// import 'package:xcbt/modules/intro/views/intro_vw.dart';
// import 'modules/task/views/task_app.dart';
// import 'package:xcbt/pages/home.dart';
// import 'package:xcbt/modules/product/views/product_app_vw.dart';
// import 'package:xcbt/modules/pengguna/views/pengguna_app_vw.dart';

void main() {
  runApp(const MyApp());
  // runApp(const ProductApp());
  // runApp(const PenggunaApp());
  // runApp(const TaskApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'FIC10-CBT-APK: XCBT',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        // home: const IntroView(),
        // home: const Home(),
        // home: SigninView(),
        // home: DashboardView(),
        // home: CarView(),
        home: OnboardingView(),
      ),
    );
  }
}
