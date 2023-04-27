
import 'package:hive/hive.dart';

class Task{
   final String name;
   bool isDone;
   Task({required this.name, this.isDone = false});


   void doneChange(){
    isDone = !isDone;
   }

}


class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0; // Unique ID to identify the type

  @override
  Task read(BinaryReader reader) {
    final name = reader.read() as String;
    final isDone = reader.read() as bool;
    return Task(name: name, isDone: isDone);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.write(obj.name);
    writer.write(obj.isDone);
  }
}