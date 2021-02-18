class Task {
  final String task;
  bool isDone;
  final int id;

  Task({this.id, this.task, this.isDone = false});

  void toggleDone() {
    this.isDone = !this.isDone;
  }
}
