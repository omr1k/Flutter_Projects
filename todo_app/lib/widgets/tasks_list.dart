import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'single_task_listtile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return SingleTaskListTile(
              isChecked: taskData.tasks[index].isDone,
              taskText: taskData.tasks[index].name,
              checkboxChange: (newValue) {
                taskData.updateTask(taskData.tasks[index],index);
              },
              listTileDelete: () {
                taskData.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
