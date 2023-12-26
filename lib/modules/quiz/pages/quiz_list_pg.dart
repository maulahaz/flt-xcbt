import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  @override
  void initState() {
    // context.read<ExamByCategBloc>().add(GetExamByCateg('Area-3'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> datas = [
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-1',
        type: 'Multiple Choice',
        description:
            'Tes angka adalah suatu jenis tes psikometri yang dirancang untuk mengukur kemampuan individu dalam memahami, menganalisis, dan menyelesaikan masalah yang melibatkan angka dan matematika.',
        duration: 30,
        kategori: 'Area-1',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-2',
        type: 'Multiple Choice',
        description:
            'Tes logika adalah metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam berpikir secara logis, analitis, dan rasional',
        duration: 30,
        kategori: 'Area-2',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-3',
        type: 'Multiple Choice',
        description:
            'Tes verbal adalah suatu metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam menggunakan dan memahami bahasa lisan atau tertulis.',
        duration: 30,
        kategori: 'Area-3',
      ),
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Area-9',
        type: 'Multiple Choice',
        description:
            'Tes verbal adalah suatu metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam menggunakan dan memahami bahasa lisan atau tertulis.',
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
                'Kategori TPA',
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
          BlocListener<ExamByCategBloc, ExamByCategState>(
            listener: (context, state) {
              if (state is ExamByCategLoading) {
                context.read<CreateExamBloc>().add(CreateExam());
                // return Text('Empty Listener');
              }
            },
            child: BlocBuilder<ExamByCategBloc, ExamByCategState>(
              builder: (context, state) {
                // if (state is ExamByCategSuccess) {
                //   return ListView.separated(
                //       shrinkWrap: true,
                //       physics: const NeverScrollableScrollPhysics(),
                //       itemCount: datas.length,
                //       separatorBuilder: (context, index) =>
                //           const SizedBox(height: 18.0),
                //       itemBuilder: (context, index) {
                //         return QuizCard(
                //           data: datas[index],
                //         );
                //       });
                // }
                if (state is ExamByCategLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: datas.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 18.0),
                      itemBuilder: (context, index) {
                        return QuizCard(
                          data: datas[index],
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
