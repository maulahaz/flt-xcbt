import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

class OnboardingIndicator extends StatelessWidget {
  final int length;
  final int currentPage;

  const OnboardingIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: currentPage == index ? 20 : 10,
            decoration: BoxDecoration(
              color: currentPage == index ? kAppPrimaryLight : kGrey,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
}