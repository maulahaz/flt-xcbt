
import 'package:flutter/material.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../configs/all_configs.dart';
import '../../../widgets/all_widgets.dart';
import '../x_quizes.dart';


class QuizFinishPage extends StatefulWidget {
  final QuizModel data;
  final int timeRemaining;

  const QuizFinishPage({
    super.key,
    required this.data,
    required this.timeRemaining,
  });

  @override
  State<QuizFinishPage> createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Image.asset('lib/assets/icons/clock.png', width: 24.0),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.timeRemaining,
          onTimerCompletion: (timeRemaining) {},
        ),
        const SizedBox(width: 24.0),
      ],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset('lib/assets/images/finish.png', width: 24.0),
              const Text(
                'Yeayy Finish',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 42.0),
              Button.filled(
                onPressed: () => context.popToRoot(),
                label: 'Kembali ke Beranda',
                color: kWhite,
                textColor: kAppPrimary,
              ),
              const SizedBox(height: 28.0),
              Button.filled(
                onPressed: () => context.push(QuizResultPage()),
                label: 'Lihat Hasil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}