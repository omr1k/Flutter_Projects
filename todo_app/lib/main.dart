import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(Constants.TaskBox);
  runApp(const AppWidget());
  // Directory directory = await getApplicationDocumentsDirectory();
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
















// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TaskData(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TasksScreen(),
//       ),
//     );
//   }
// }
