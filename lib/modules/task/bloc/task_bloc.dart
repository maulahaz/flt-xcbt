import 'package:flutter_bloc/flutter_bloc.dart';

import '../all_tasks.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState>{
  TaskBloc():super(InitTaskState());
}