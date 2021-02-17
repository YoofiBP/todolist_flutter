import 'package:flutter/material.dart';
import '../components/task_list.dart';
import './add_task_screen.dart';
import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> tasks = [
    Task(task: "Wash clothes"),
    Task(task: "Code"),
    Task(task: "Feed Dog"),
    Task(task: "Eat Lunch"),
  ];

  void addTask(newTask) {
    setState(() {
      tasks.add(Task(task: newTask));
    });
  }

  void toggleComplete(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[300],
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskModal(
                      addCallback: addTask,
                    ),
                  )));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlue[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlue[300],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${this.tasks.length} tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 100,
                child: TaskList(
                  tasks: this.tasks,
                  toggleCallback: toggleComplete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
