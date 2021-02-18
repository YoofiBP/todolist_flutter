import 'package:flutter/material.dart';
import 'package:todolist/models/todolist.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class TaskRow extends StatelessWidget {
  final Task task;
  final Function onCheck;

  TaskRow({@required this.task, @required this.onCheck});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 50),
      child: ListTile(
        title: Text(task.task,
            style: TextStyle(
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            Provider.of<TodoModel>(context, listen: false)
                .toggleDone(this.task.id);
          },
        ),
      ),
    );
  }
}
