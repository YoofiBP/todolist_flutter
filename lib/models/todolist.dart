import 'dart:collection';
// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'task.dart';

class TodoModel extends ChangeNotifier {
  List<Task> _tasks = [
    Task(id: 1, task: "Wash clothes"),
    Task(id: 2, task: "Code"),
    Task(id: 3, task: "Feed Dog"),
    Task(id: 4, task: "Eat Lunch"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeAll() {
    _tasks.clear();
    notifyListeners();
  }

  int get tasksLength => _tasks.length;
  int get nextId => _tasks.length + 1;

  void toggleDone(int id) {
    Task currentTask = _tasks.firstWhere((task) => task.id == id);
    currentTask.toggleDone();
    notifyListeners();
  }
}
