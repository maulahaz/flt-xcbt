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
    context.read<ExamByCategBloc>().add(GetExamByCateg('Area-3'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> datas = [
      QuizModel(
        image: 'lib/assets/images/documents.png',
        name: 'Tes Angka',
        type: 'Multiple Choice',
        description:
            'Tes angka adalah suatu jenis tes psikometri yang dirancang untuk mengukur kemampuan individu dalam memahami, menganalisis, dan menyelesaikan masalah yang melibatkan angka dan matematika.',
        duration: 30,
        kategori: 'Numeric',
      ),
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
                // context
                //         .read<CreateUjianBloc>()
                //         .add(const CreateUjianEvent.createUjian());
                // return Text('Empty Listener');
              }
            },
            child: BlocBuilder<ExamByCategBloc, ExamByCategState>(
              builder: (context, state) {
                if (state is ExamByCategSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: datas.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 18.0),
                    itemBuilder: (context, index) => QuizCard(
                      data: datas[index],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          // BlocListener<ExamByCategBloc, ExamByCategState>(
          //   listener: (context, state) {
          //     state.maybeWhen(
          //       orElse: () {},
          //       notfound: () {
          //         context
          //             .read<CreateUjianBloc>()
          //             .add(const CreateUjianEvent.createUjian());
          //       },
          //     );
          //   },
          //   child: BlocBuilder<ExamByCategBloc, ExamByCategState>(
          //     builder: (context, state) {
          //       return state.maybeWhen(orElse: () {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }, success: (data) {
          //         return ListView.separated(
          //           shrinkWrap: true,
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemCount: datas.length,
          //           separatorBuilder: (context, index) =>
          //               const SizedBox(height: 18.0),
          //           itemBuilder: (context, index) => QuizCard(
          //             data: datas[index],
          //           ),
          //         );
          //       }, notfound: () {
          //         return BlocBuilder<CreateUjianBloc, CreateUjianState>(
          //           builder: (context, state) {
          //             return state.maybeWhen(
          //               orElse: () {
          //                 return const Center(
          //                   child: CircularProgressIndicator(),
          //                 );
          //               },
          //               success: () {
          //                 return ListView.separated(
          //                   shrinkWrap: true,
          //                   physics: const NeverScrollableScrollPhysics(),
          //                   itemCount: datas.length,
          //                   separatorBuilder: (context, index) =>
          //                       const SizedBox(height: 18.0),
          //                   itemBuilder: (context, index) => QuizCard(
          //                     data: datas[index],
          //                   ),
          //                 );
          //               },
          //             );
          //           },
          //         );
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
