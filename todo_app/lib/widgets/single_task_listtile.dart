import 'package:flutter/material.dart';

class SingleTaskListTile extends StatelessWidget {
  final bool isChecked;
  final taskText;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  SingleTaskListTile({required this.isChecked, required this.taskText, required this.checkboxChange, required this.listTileDelete});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
      value: isChecked,
      activeColor: Colors.teal[400],
      onChanged: checkboxChange,
    ),
    onLongPress: listTileDelete,
    );
  }
}