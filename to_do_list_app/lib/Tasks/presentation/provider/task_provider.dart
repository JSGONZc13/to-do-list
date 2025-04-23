import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/Tasks/data/datasources/task_local_datasource.dart';
import 'package:to_do_list_app/Tasks/data/repositories/task_repository_impl.dart';
import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/domain/use_cases/add_task.dart';
import 'package:to_do_list_app/Tasks/domain/use_cases/del_task.dart';
import 'package:to_do_list_app/Tasks/domain/use_cases/get_tasks.dart';

class TaskProvider extends ChangeNotifier {
  final repository = TaskRepositoryImpl(TaskLocalDataSource());
  late final GetTasks _getTasks = GetTasks(repository);
  late final AddTask _addTask = AddTask(repository);
  late final DelTask _delTask = DelTask(repository);

  List<Task> tasks = [];

  Future<void> getTasks() async {
    tasks = await _getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _addTask(task);
    await (getTasks());
  }

  Future<void> delTask(Task task) async {
    await _delTask(task);
    await (getTasks());
  }
}
