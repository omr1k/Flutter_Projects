import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/task_controller.dart';

class AddScreen extends StatelessWidget {
  final Function addTaskCallBack;
  const AddScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(30),
      color: AppColors.AppColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: AppColors.AppTextColor,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Task Here',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.AppTextColor),
              ),
            ),
            autofocus: true,
            textAlign: TextAlign.left,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (newTaskTitle == null) {
                    Navigator.pop(context);
              } else {
                Provider.of<TaskData>(context, listen: false)
                    .addTaskToDB(newTaskTitle!);
                    Navigator.pop(context);
              }
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
                backgroundColor: AppColors.AppAccentColor,
                foregroundColor: AppColors.AppTextColor),
          )
        ],
      ),
    );
  }
}
