import 'package:to_do_list_app/Tasks/core/utils/database_helper.dart';
import 'package:to_do_list_app/Tasks/data/models/task_model.dart';

class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks() async {
    final db = await DataBaseHelper.instance.database;
    final result = await db.query('tasks');
    return result.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<void> addTask(TaskModel task) async {
    final db = await DataBaseHelper.instance.database;
    await db.insert('tasks', task.toMap());
  }

  Future<void> delTask(TaskModel task) async {
    final db = await DataBaseHelper.instance.database;
    await db.delete(
      'tasks',
      where: 'intId = ?',
      whereArgs: [task.intId],
    );
  }
}
