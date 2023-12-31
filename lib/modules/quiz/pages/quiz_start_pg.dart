import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../configs/all_configs.dart';
import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';

class QuizStartPage extends StatefulWidget {
  final QuizModel data;

  const QuizStartPage({
    super.key,
    required this.data,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  void initState() {
    context.read<ExamByCategBloc>().add(GetExamByCateg(widget.data.kategori));
    super.initState();
  }

  int quizNumber = 1;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('lib/assets/icons/clock.png', width: 24.0),
            SizedBox(width: 10.0),
            BlocListener<ExamByCategBloc, ExamByCategState>(
              listener: (context, state) {
                if (state is ExamByCategSuccess) {
                  if (state.result.timer == 0) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Time\'s up'),
                              content: const Text(
                                  'Time is elapsed, please click button to check the result'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        context.pushReplacement(QuizFinishPage(
                                          data: widget.data,
                                          timeRemaining: 0,
                                        )),
                                    child: const Text('End'))
                              ],
                            ));
                  } else {
                    context
                        .read<DaftarSoalBloc>()
                        .add(GetDaftarSoal(state.result.data));
                  }
                } else if (state is ExamByCategEmpty) {
                  context.read<CreateExamBloc>().add(
                      CreateExamByCategory(category: widget.data.kategori));
                  context
                      .read<ExamByCategBloc>()
                      .add(GetExamByCateg(widget.data.kategori));
                }
                ;
              },
              child: BlocBuilder<ExamByCategBloc, ExamByCategState>(
                builder: (context, state) {
                  if (state is ExamByCategSuccess) {
                    return CountdownTimer(
                      duration: state.result.timer,
                      onTimerCompletion: (timeRemaining) {
                        context.pushReplacement(QuizFinishPage(
                          data: widget.data,
                          timeRemaining: timeRemaining,
                        ));
                      },
                    );
                  } else {
                    return Text('End');
                  }
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  context.pushReplacement(QuizFinishPage(
                    data: widget.data,
                    timeRemaining: 0,
                  ));
                  print('Give up');
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                )),
          ],
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Question',
            style: TextStyle(fontSize: 18),
          ),
          BlocListener<ExamBloc, ExamState>(
            listener: (context, state) {
              if (state is GetExamResultByCategoryState) {
                context.pushReplacement(QuizFinishPage(
                  data: widget.data,
                  timeRemaining: 0,
                ));
              }
            },
            child: BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
              builder: (context, state) {
                if (state is DaftarSoalSuccess) {
                  return Row(
                    children: [
                      Flexible(
                        child: LinearProgressIndicator(
                          value: (state.index + 1) / state.data.length,
                          color: kAppPrimary,
                          backgroundColor: kWhite,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        '${(state.index + 1)}/${state.data.length}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                } else {
                  return Text('Generating Question...');
                }
              },
            ),
          ),
          SizedBox(height: 16.0),
          QuizMultiChoice(
            kategori: widget.data.kategori,
          ),
        ],
      ),
    );
  }
}
