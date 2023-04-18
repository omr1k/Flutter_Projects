import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddScreen extends StatelessWidget {
  final Function addTaskCallBack;
  const AddScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task',textAlign: TextAlign.center,style: TextStyle(fontSize: 30, color: Colors.indigo,fontWeight: FontWeight.bold),),
          TextField(
            autofocus: true,
            textAlign: TextAlign.left,
            onChanged: (newText){
             newTaskTitle = newText;
            },
          ),
          SizedBox(height: 30,),
          TextButton(
            onPressed: (){
              Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: Text('Add'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal[400],
            foregroundColor: Colors.white
          ),
          )
        ],
      ),
    );
  }
}