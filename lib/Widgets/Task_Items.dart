import 'package:flutter/material.dart';
import 'package:schedule_task_app/Modal/Task_Modal.dart';

class TasksItems extends StatelessWidget {

  final Task todo;
  final taskCompleted;
  final deleteTasked;

  TasksItems
  ({
  required this.deleteTasked,
  required this.taskCompleted,
  required this.todo,
  super.key, 
  });

  @override
  Widget build(BuildContext context) {
  return Container(
  margin: EdgeInsets.only(
  top: 10,
  bottom: 10,
  ),
  child: ListTile(
  onTap: () 
  {
    taskCompleted(todo);
  },
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(40),
  ),
  contentPadding: EdgeInsets.symmetric(
  horizontal: 20,
  ),
  title: Text(
  todo.taskText!,
  style: TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  decoration: todo.isDone? TextDecoration.lineThrough : null,

  ),
  ),
  tileColor: Colors.teal,
  leading: Icon(
  todo.isDone?  Icons.check_box : Icons.check_box_outline_blank,
  size: 25,
  color: Colors.white,
  ),
  trailing: IconButton(
  onPressed: () 
  {
    deleteTasked(todo.id);
  }, 
  icon: const Icon(
  Icons.delete,
  size: 25,
  color: Colors.white,
  ),)
  ),
  );
  }
}