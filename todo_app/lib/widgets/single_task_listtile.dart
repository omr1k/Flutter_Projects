import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class SingleTaskListTile extends StatelessWidget {
  final bool isChecked;
  final taskText;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  SingleTaskListTile(
      {required this.isChecked,
      required this.taskText,
      required this.checkboxChange,
      required this.listTileDelete});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: AppColors.AppAccentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ListTile(
            title: Text(
              taskText,
              style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              value: isChecked,
              activeColor: AppColors.AppAccentColor,
              onChanged: checkboxChange,
            ),
            onLongPress: listTileDelete,
          ),
        ),
      ),
    );
  }
}
