class Task {
  String? id;
  String? taskText;
  bool isDone;

  Task({
    required this.id,
    required this.taskText,
    this.isDone = false,
  });

  static List<Task> taskList() {
    return 
    [
      Task(id: '01', taskText: 'Task 1', isDone: true ),
      Task(id: '02', taskText: 'Task 2' ),
    ];
  }
}