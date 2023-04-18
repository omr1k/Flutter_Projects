import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  
  List<Task> tasks = [
    Task(name: 'fdsfsdf', isDone: false),
    Task(name: 'zzzfadffdsfsdf', isDone: false),
    Task(name: 'xxxfdsfsdf', isDone: false),
    Task(name: '111fdsfsdf', isDone: false),
    Task(name: 'aaaafqqdsfsdf', isDone: false),
  ];

  void addTask(String newTaskTitle){
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

}