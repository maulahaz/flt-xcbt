import 'package:flutter/material.dart';
import 'package:xcbt/widgets/all_widgets.dart';

import '../../../helpers/x_helpers.dart';
import '../../authorization/x_authorizations.dart';
import '../x_onboardings.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: 'lib/assets/images/screen1.png',
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
    OnboardingModel(
      image: 'lib/assets/images/screen2.png',
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
    OnboardingModel(
      image: 'lib/assets/images/screen3.png',
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
  ];

  void navigate() {
    context.pushReplacement(const LoginView());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/ornament.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              SkipButton(onPressed: navigate),
              OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData,
              ),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      currentPage++;
                      setState(() {});
                    } else {
                      MySessions.saveAccessFirstTime();
                      navigate();
                    }
                  },
                  label: 'Continue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}