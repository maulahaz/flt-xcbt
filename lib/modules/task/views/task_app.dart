import 'package:flutter/material.dart';

import '../all_notes.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NoteApp by FIC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const TaskView(),
      );
  }
}