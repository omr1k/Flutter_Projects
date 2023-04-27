import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/screens/add_screen.dart';
import 'package:todo_app/widgets/circular_button.dart';
import '../controllers/task_controller.dart';
import '../widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    try {
      Provider.of<TaskData>(context, listen: false).updateNotifierList();
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddScreen(
                  (newTaskTitle) {},
                ),
              ),
            ),
          );
        },
        backgroundColor: AppColors.AppTextColor,
        child: Icon(Icons.add),
      ),
      backgroundColor: AppColors.AppColor,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircularButton(
                      buttonText:
                          "${Provider.of<TaskData>(context).tasks.length}"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'To Do',
                    style: TextStyle(
                      color: AppColors.AppTextColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'This App Powered by Flutter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  height: 80.0,
                                  width: 80.0,
                                  child: Image.network(
                                    'https://logowik.com/content/uploads/images/flutter5786.jpg',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextButton(
                                  onPressed: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://github.com/omr1k/Flutter_Projects/tree/main/todo_app"),
                                    );
                                  },
                                  child: Text(
                                    'Check App on Github',
                                    style: TextStyle(
                                        color: AppColors.AppTextColor),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        color: AppColors.AppTextColor),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.info),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .deleteAllTasks();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.AppTextColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Provider.of<TaskData>(context).tasks.length != 0
                        ? TasksList()
                        : Center(
                            child: Text("No Data"),
                          ), //TasksList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
