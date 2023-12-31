import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/all_configs.dart';
import '../../../../widgets/all_widgets.dart';
import '../../x_quizes.dart';

class QuizMultiChoice extends StatefulWidget {
  final String kategori;
  const QuizMultiChoice({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  @override
  State<QuizMultiChoice> createState() => _QuizMultiChoiceState();
}

class _QuizMultiChoiceState extends State<QuizMultiChoice> {
  String selectedAnswer = '';
  String jawaban = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaftarSoalBloc, DaftarSoalState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DaftarSoalSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: kBlack.withOpacity(0.14),
                      blurRadius: 17,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  state.data[state.index].pertanyaan,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 34.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnswerChoices(
                    label: state.data[state.index].opsiA,
                    isSelected: selectedAnswer == state.data[state.index].opsiA,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                        jawaban = 'a';
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: state.data[state.index].opsiB,
                    isSelected: selectedAnswer == state.data[state.index].opsiB,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                        jawaban = 'b';
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: state.data[state.index].opsiC,
                    isSelected: selectedAnswer == state.data[state.index].opsiC,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                        jawaban = 'c';
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: state.data[state.index].opsiD,
                    isSelected: selectedAnswer == state.data[state.index].opsiD,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                        jawaban = 'd';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 38.0),
              jawaban.isEmpty
                  ? MyButtons.disabled(context, 'Next')
                  : state.isNext
                      ? MyButtons.primary(context, 'Next', () {
                          context.read<ExamBloc>().add(PostExamAnswer(
                                soalId: state.data[state.index].id,
                                answer: jawaban,
                                category: widget.kategori,
                              ));
                          context.read<DaftarSoalBloc>().add(NextDaftarSoal());
                        })
                      : MyButtons.danger(context, 'Last', () {
                          context.read<ExamBloc>().add(PostExamAnswer(
                                soalId: state.data[state.index].id,
                                answer: jawaban,
                                category: widget.kategori,
                              ));
                          context
                              .read<ExamBloc>()
                              .add(GetExamResultByCategory(widget.kategori));
                        })
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
            // child: Text('Daftar Soal N/A'),
          );
        }
      },
    );
  }
}
