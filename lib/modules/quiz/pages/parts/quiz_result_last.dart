import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../configs/all_configs.dart';
import '../../x_quizes.dart';

class QuizResultLast extends StatelessWidget {
  final ExamResult lastExamResult;
  const QuizResultLast({super.key, required this.lastExamResult});

  @override
  Widget build(BuildContext context) {
    var correct = lastExamResult.totalCorrect;
    var wrong = lastExamResult.totalSoal - lastExamResult.totalCorrect;
    var totalQuestion = lastExamResult.totalSoal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Quiz Result',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lastExamResult.kategori,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    ResultValue.correct(correct),
                    SizedBox(height: 18.0),
                    ResultValue.wrong(wrong),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularStepProgressIndicator(
                      totalSteps: totalQuestion,
                      currentStep: correct,
                      stepSize: 10,
                      selectedColor: kAppPrimary,
                      unselectedColor: kRed,
                      padding: 0,
                      width: 140,
                      height: 140,
                      selectedStepSize: 24,
                      unselectedStepSize: 24,
                      roundedCap: (_, __) => true,
                    ),
                    Positioned(
                      top: 50,
                      child: Text('${lastExamResult.score.toString()}%')),
                    Positioned(
                      top: 65,
                      child: Text(lastExamResult.hasil!)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
