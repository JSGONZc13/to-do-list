import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/Tasks/infrastructure/data_sources/task_local_datasource.dart';
import 'package:to_do_list_app/Tasks/infrastructure/repositories_impl/task_repository_impl.dart';
import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/application/use_cases/add_task.dart';
import 'package:to_do_list_app/Tasks/application/use_cases/del_task.dart';
import 'package:to_do_list_app/Tasks/application/use_cases/get_tasks.dart';
import 'package:to_do_list_app/Tasks/application/use_cases/update_task.dart';

class TaskProvider extends ChangeNotifier {
  final repository = TaskRepositoryImpl(TaskLocalDataSource());
  late final GetTasks _getTasks = GetTasks(repository);
  late final AddTask _addTask = AddTask(repository);
  late final DelTask _delTask = DelTask(repository);
  late final UpdateTask _updateTask = UpdateTask(repository);

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

  Future<void> updateTask(Task task) async {
    await _updateTask(task);
    await (getTasks());
  }
}
