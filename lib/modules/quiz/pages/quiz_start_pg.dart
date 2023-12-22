import 'package:flutter/material.dart';

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
    // context.read<UjianByKategoriBloc>().add(
    //       UjianByKategoriEvent.getUjianByKategori(widget.data.kategori),
    //     );
    super.initState();
  }

  int quizNumber = 1;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Image.asset('lib/assets/icons/clock.png', width: 24.0),
        SizedBox(width: 8.0),
        // BlocListener<UjianByKategoriBloc, UjianByKategoriState>(
        //   listener: (context, state) {
        //     state.maybeWhen(
        //       orElse: () {},
        //       success: (e) {
        //         if (e.timer == 0) {
        //           //show dialog waktu habis
        //           showDialog(
        //               context: context,
        //               builder: (context) => AlertDialog(
        //                     title: const Text('Waktu Habis'),
        //                     content: const Text(
        //                         'Waktu anda telah habis, silahkan klik tombol selesai untuk melihat hasil'),
        //                     actions: [
        //                       TextButton(
        //                           onPressed: () =>
        //                               context.pushReplacement(QuizFinishPage(
        //                                 data: widget.data,
        //                                 timeRemaining: 0,
        //                               )),
        //                           child: const Text('Selesai'))
        //                     ],
        //                   ));
        //         } else {
        //           context.read<DaftarSoalBloc>().add(
        //                 DaftarSoalEvent.getDaftarSoal(
        //                   e.data,
        //                 ),
        //               );
        //         }
        //       },
        //     );
        //   },
        //   child: BlocBuilder<UjianByKategoriBloc, UjianByKategoriState>(
        //     builder: (context, state) {
        //       return state.maybeMap(
        //         orElse: () {
        //           return const SizedBox();
        //         },
        //         success: (e) {
        //           return CountdownTimer(
        //             duration: e.response.timer,
        //             onTimerCompletion: (timeRemaining) {
        //               context.pushReplacement(QuizFinishPage(
        //                 data: widget.data,
        //                 timeRemaining: timeRemaining,
        //               ));
        //             },
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
        IconButton(
            onPressed: () {
              // context.pushReplacement(QuizFinishPage(
              //   data: widget.data,
              //   timeRemaining: 0,
              // ));
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          // BlocListener<HitungNilaiBloc, HitungNilaiState>(
          //   listener: (context, state) {
          //     state.maybeWhen(
          //       orElse: () {},
          //       success: (e) {
          //         context.pushReplacement(QuizFinishPage(
          //           data: widget.data,
          //           timeRemaining: 0,
          //         ));
          //       },
          //     );
          //   },
          //   child: BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
          //     builder: (context, state) {
          //       return state.maybeMap(
          //         orElse: () {
          //           return const SizedBox();
          //         },
          //         success: (e) {
          //           return Row(
          //             children: [
          //               Flexible(
          //                 child: LinearProgressIndicator(
          //                   value: (e.index + 1) / e.data.length,
          //                   color: AppColors.primary,
          //                 ),
          //               ),
          //               const SizedBox(width: 16.0),
          //               Text(
          //                 '${e.index + 1}/${e.data.length}',
          //                 style: const TextStyle(fontSize: 16),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(height: 16.0),
          QuizMultiChoice(
            kategori: widget.data.kategori,
          ),
        ],
      ),
    );
  }
}