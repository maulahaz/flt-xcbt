import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/configs/all_configs.dart';

import 'helpers/x_helpers.dart';
import 'modules/content/x_contents.dart';
import 'modules/home/x_homes.dart';
import 'modules/materi/x_materis.dart';
import 'modules/onboarding/x_onboardings.dart';
import 'modules/authorization/x_authorizations.dart';
import 'modules/quiz/x_quizes.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => SigninBloc()), 
        BlocProvider(create: (context) => SignoutBloc()),
        BlocProvider(create: (context) => ContentBloc()),
        BlocProvider(create: (context) => MateriBloc()),
        BlocProvider(create: (context) => ExamByCategBloc()),
        BlocProvider(create: (context) => DaftarSoalBloc()),
        BlocProvider(create: (context) => CreateExamBloc()),
      ],
      child: MaterialApp(
        title: 'FIC10-CBT-APK: XCBT',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        // home: const IntroView(),
        // home: const Home(),
        // home: SigninView(),
        // home: DashboardView(),
        // home: CarView(),
        // home: OnboardingView(),
        home: FutureBuilder<AuthorizationModel>(
            future: AuthorizationService.getAuthData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DashboardView();
              } else {}
              return FutureBuilder<bool>(
                  future: MySessions.isAccessFirstTime(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data! ? LoginView() : OnboardingView();
                    } else {}
                    return OnboardingView();
                  });
            }),
      ),
    );
  }
}
