import 'package:flutter/material.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../materi/x_materis.dart';
import '../../quiz/x_quizes.dart';
import '../x_homes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeaderHome(),
          const SizedBox(height: 24.0),
          TitleSection(
            title: 'Beranda',
            onSeeAllTap: () {},
          ),
          const SizedBox(height: 16.0),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 24.0,
            ),
            children: [
              MenuHome(
                imagePath: 'lib/assets/images/about-us.png',
                label: 'About Us',
                onPressed: () {
                  context.push(const AboutUsView());
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/tips.png',
                label: 'Tips & Tricks ',
                onPressed: () {
                  context.push(const TipsAndTricksView());
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/documents.png',
                label: 'Materi',
                onPressed: () {
                  context.push(const MateriPage());
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/quiz.png',
                label: 'Quiz',
                onPressed: () {
                  context.push(const QuizListPage());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
