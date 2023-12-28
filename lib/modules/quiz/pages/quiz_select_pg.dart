import 'package:flutter/material.dart';

import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';

class QuizSelectPage extends StatelessWidget {
  const QuizSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> datas = [
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-1',
        type: 'Multiple Choice',
        description: 'Collection of some Question about Area-0 and 1',
        duration: 30,
        kategori: 'Area-1',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-2',
        type: 'Multiple Choice',
        description: 'Collection of some Question about Area-2',
        duration: 30,
        kategori: 'Area-2',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-3',
        type: 'Multiple Choice',
        description: 'Collection of some Question about Area-3',
        duration: 30,
        kategori: 'Area-3',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-9',
        type: 'Multiple Choice',
        description: 'Collection of some Question about Area-9',
        duration: 30,
        kategori: 'Area-9',
      ),
    ];

    return AppScaffold(
      appBarTitle: const Text('Quiz'),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CBT Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.sort),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: datas.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 18.0),
              itemBuilder: (context, index) {
                return QuizCard(
                  data: datas[index],
                );
              }),
        ],
      ),
    );
  }
}
