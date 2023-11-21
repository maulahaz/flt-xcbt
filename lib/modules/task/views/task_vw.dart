import 'package:flutter/material.dart';

import '../all_notes.dart';

class TaskView extends StatefulWidget {
  const TaskView({ Key? key }) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController titleCtr = TextEditingController();
  List<TaskModel> tasksList = [];

  @override
  void initState() {
    super.initState();
    loadTasks();  
  }

  loadTasks() async {
    List<TaskModel> tasks = await DatabaseHelper.instance.getAllTasks();
    setState(() {
      tasksList = tasks;
    });
  }

  addTask() async {
    if (titleCtr.text.isNotEmpty) {
      TaskModel newTask = TaskModel(title: titleCtr.text);
      await DatabaseHelper.instance.insertTask(newTask);
      titleCtr.clear();
      loadTasks();
    }
  }

  toggleTaskStatus(TaskModel task) async {
    task.isDone = !task.isDone;
    await DatabaseHelper.instance.updateTask(task);
    loadTasks();
  }

  deleteTask(TaskModel task) async {
    await DatabaseHelper.instance.deleteTask(task.id!);
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Task View'),),
          ),
        ],
      ),
    );
  }
}