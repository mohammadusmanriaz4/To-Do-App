import 'package:flutter/material.dart';
import 'package:schedule_task_app/Modal/Task_Modal.dart';
import 'package:schedule_task_app/Widgets/Task_Items.dart';

class TaskListView extends StatefulWidget {


  TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final taskList = Task.taskList();
  final _todoController = TextEditingController();
  List<Task>_foundtask = [];

  @override
  void initState() {
   _foundtask = taskList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return SafeArea(
  child: Scaffold(
  
  appBar: AppBar(
  centerTitle: true,
  iconTheme: const IconThemeData(
  color: Colors.white,
  ),
  backgroundColor: Colors.teal,
  title: const Text(
  'Schedule Task',
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  ),),
  ),


  body: Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20,
  
  ),
  child: Column(
  children: [

  const SizedBox(
  height: 10,
  ),

  //Search Task   
  Container(
  decoration: BoxDecoration(
  color: Colors.teal,
  borderRadius: BorderRadius.circular(40),
  ),
  child: TextField(
  onChanged: (value) => _searchFilter(value),
  style: const TextStyle(
  color: Colors.white,
  fontSize: 16,
  ),
  cursorColor: Colors.white,
  decoration: const InputDecoration(
  hintText: 'Search Tasks',
  hintStyle: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  prefixIcon: Icon(
  Icons.search,
  color: Colors.white,
  ),
  border: InputBorder.none
  ),
  ),
  ), 

  const SizedBox(
  height: 10,
  ),

  //Add Task
  Container(
  decoration: BoxDecoration(
  color: Colors.teal,
  borderRadius: BorderRadius.circular(40),
  ),
  child: TextField(
  controller: _todoController,
  style: const TextStyle(
  color: Colors.white,
  fontSize: 16,
  ),
  cursorColor: Colors.white,
  decoration: InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 10,
  ),
  hintText: 'Add Task here...',
  hintStyle: const TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  suffixIcon: InkWell(
  onTap: () {
    _addNewTask(_todoController.text);
  },
  child: const Icon(
  Icons.add,
  size: 25,
  color: Colors.white,
  ),
  ),
  border: InputBorder.none
  ),
  ),
  ), 






  //Shows List of Added Tasks
  Expanded(
  child: ListView(
  children: [
  
  Container(
  margin: const EdgeInsets.only(
  top: 20,
  bottom: 20,
  ),
  child: const Text(
  'Task List',
  style: TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w500,
  ),
  ),
  ),

  for (Task tasks in _foundtask.reversed)
  TasksItems(
  todo: tasks, 
  taskCompleted: _onTaskCompleted,
  deleteTasked: _deleteTask,
  
  ),
  ],


  ),),



  

    ],
    ),
  ),
  ),);
  }


  
  //Function to mard task as done
  void _onTaskCompleted (Task todo)
  {
    setState(() 
    {
      todo.isDone = !todo.isDone;
    });
    
  }
  
  //Function to delete task
  void _deleteTask (String id)
  {
    setState(() 
    {
      taskList.removeWhere((item) => item.id == id);
    });
  }

  //Function to add new task
  void _addNewTask (String toDo)
  { 
    if(toDo.isNotEmpty)
    {
      setState(() 
      {
      taskList.add(
      Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      taskText: toDo,
      ));
      });
    }
    else
    {
      return;
    }
    _todoController.clear();
    
  }
  

  //Function to search task
  void _searchFilter (String searchKeyword)
  {
    List<Task> results = [];
    if(searchKeyword.isEmpty)
    {
      results =taskList;
    }
    else
    {
      results = taskList.where((item) => item.taskText!
      .toLowerCase().contains(
      searchKeyword.toLowerCase())).toList();
    }
    setState(() 
    {
     _foundtask = results;
    });
  }


}