import 'package:flutter/material.dart';
import 'task_row.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  final List<Map<String, dynamic>> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, idx) {
        return TaskRow(task: tasks[idx]);
      },
    );
  }
}
