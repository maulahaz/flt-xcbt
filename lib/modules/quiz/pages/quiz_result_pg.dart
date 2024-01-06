import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../configs/all_configs.dart';
import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage({super.key});

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  @override
  void initState() {
    context.read<ExamBloc>().add(GetExamResult());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontalSize = 16.0;
    const paddingHorizontal =
        EdgeInsets.symmetric(horizontal: paddingHorizontalSize);

    return AppScaffold(
      appBarTitle: const Text('Quiz Result'),
      body: ListView(
        children: [
          const SizedBox(height: 30.0),
          Padding(
            padding: paddingHorizontal,
            child: BlocBuilder<ExamBloc, ExamState>(
              builder: (context, state) {
                if (state is GetExamResultState) {
                  var lastExamResult = state.result.data.first;
                  return QuizResultLast(lastExamResult: lastExamResult);
                } else {
                  return SizedBox();
                }
                // switch (state.runtimeType) {
                //   case GetExamResultState:
                //     return QuizResultLast(;
                //   default:
                //     return SizedBox();
                // }
              },
            ),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Quiz Results',
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
            child: BlocBuilder<ExamBloc, ExamState>(
              builder: (context, state) {
                if (state is GetExamResultState) {
                  List<ExamResult> lstData = state.result.data;
                  var indexToRemove = 0;
                  List newExamResultList = lstData.where((x) => lstData.indexOf(x) != indexToRemove).toList();
                  return Row(
                    children: newExamResultList.map((item) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuizResultHistoryCard(data: item),
                            ))
                        .toList(),
                  );
                  // return Row(
                  //   children: state.result.data.map((item) => Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: QuizResultHistoryCard(data: item),
                  //           ))
                  //       .toList(),
                  // );
                } else {
                  return SizedBox();
                }
              },
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
