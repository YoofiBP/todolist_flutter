import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({
    Key key,
    @required this.task,
  }) : super(key: key);

  final Map<String, dynamic> task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 50),
      child: ListTile(
        title: Text(task["task"],
            style: TextStyle(
              decoration: task["completed"]
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )),
        trailing: Checkbox(
          value: task["completed"],
          onChanged: (bool value) {},
        ),
      ),
    );
  }
}
