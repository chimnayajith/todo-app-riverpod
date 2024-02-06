import 'package:todo_app/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/repositories/helper.dart';

class TaskRepository {
  Future<List<Task>> getAllTasks() async {
    final Database? db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result =
        await db!.rawQuery("SELECT * FROM todo");
    List<Task> todos = result.map((each) => Task.fromJson(each)).toList();
    return todos;
  }

  Future<void> addTask(Task task) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db!.insert('todo', task.toJson());
  }

  Future<void> deleteTask(String id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db!.delete('flashcars', where: "id= $id");
  }
}
