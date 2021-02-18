import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/models/todolist.dart';

class AddTaskModal extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todo, child) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlue[300],
                    fontSize: 30,
                  ),
                ),
                TextField(
                  controller: this.controller,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide())),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: FlatButton(
                    height: 50,
                    minWidth: 300,
                    color: Colors.lightBlue[300],
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      // this.addCallback(this.controller.text);
                      Provider.of<TodoModel>(context, listen: false).add(
                        Task(task: this.controller.text, id: todo.nextId),
                      );
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
