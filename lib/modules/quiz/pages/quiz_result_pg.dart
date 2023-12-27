import 'package:flutter/material.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../configs/all_configs.dart';
import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontalSize = 16.0;
    const paddingHorizontal =
        EdgeInsets.symmetric(horizontal: paddingHorizontalSize);

    final List<QuizModel> datas = [
      QuizModel(
          image: 'lib/assets/images/documents.png',
          name: 'Tes Angka',
          type: 'Multiple Choice',
          description:
              'Tes angka adalah suatu jenis tes psikometri yang dirancang untuk mengukur kemampuan individu dalam memahami, menganalisis, dan menyelesaikan masalah yang melibatkan angka dan matematika.',
          duration: 30,
          kategori: 'Numeric'),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Tes Logika',
        type: 'Multiple Choice',
        description:
            'Tes logika adalah metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam berpikir secara logis, analitis, dan rasional',
        duration: 30,
        kategori: 'Logika',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Tes Verbal',
        type: 'Multiple Choice',
        description:
            'Tes verbal adalah suatu metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam menggunakan dan memahami bahasa lisan atau tertulis.',
        duration: 30,
        kategori: 'Verbal',
      ),
    ];

    return AppScaffold(
      appBarTitle: const Text('Quiz Result'),
      body: ListView(
        children: [
          const SizedBox(height: 30.0),
          const Padding(
            padding: paddingHorizontal,
            child: QuizResultLast(),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Quiz',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontalSize - 8.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: datas
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QuizAvailableCard(data: item),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
      bottomNavigationBar: Container(
        color: kWhite,
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () async {
            // await stopKioskMode();
            context.popToRoot();
          },
          label: 'Back to Dashboard',
        ),
      ),
    );
  }
}