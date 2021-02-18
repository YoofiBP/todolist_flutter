import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/todolist.dart';
import 'task_row.dart';

class TaskList extends StatelessWidget {
  final Function toggleCallback;
  TaskList({@required this.toggleCallback});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todo, child) {
        return ListView.builder(
          itemCount: todo.tasksLength,
          itemBuilder: (context, idx) {
            return TaskRow(
              task: todo.tasks[idx],
              onCheck: this.toggleCallback,
            );
          },
        );
      },
    );
  }
}
