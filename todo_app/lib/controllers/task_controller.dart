import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  Box<Task> box = Hive.box(Constants.TaskBox);
  List<Task> tasks = [];

  void addTaskToDB(String newTaskTitle) async {
    box.add(Task(name: newTaskTitle));
    updateNotifierList();
    notifyListeners();
  }

  void updateTask(Task task, int index) {
    // task.doneChange();

    final modifiedTask = box.getAt(index)!;
    modifiedTask.doneChange();
    box.putAt(index, modifiedTask);
    updateNotifierList();
    notifyListeners();
  }

  void deleteTask(int index) {
    box.deleteAt(index);
    updateNotifierList();
    notifyListeners();
  }

  void deleteAllTasks() {
    box.clear();
    updateNotifierList();
    notifyListeners();
  }
  void updateNotifierList() {
    tasks = box.values.toList().cast<Task>();
  }
}
