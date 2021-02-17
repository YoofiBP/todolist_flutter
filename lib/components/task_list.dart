import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_row.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function toggleCallback;
  TaskList({@required this.tasks, @required this.toggleCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.tasks.length,
      itemBuilder: (context, idx) {
        return TaskRow(
          task: this.tasks[idx],
          onCheck: this.toggleCallback,
        );
      },
    );
  }
}
