import 'package:to_do_list_app/Tasks/infrastructure/data_sources/task_local_datasource.dart';
import 'package:to_do_list_app/Tasks/application/models/task_model.dart';
import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource taskLocalDataSource;
  TaskRepositoryImpl(this.taskLocalDataSource);

  @override
  Future<void> addTask(Task task) async {
    await taskLocalDataSource
        .addTask(TaskModel(strTitle: task.strTitle, intIdDone: 0));
  }

  @override
  Future<void> delTask(Task task) async {
    await taskLocalDataSource.delTask(TaskModel(
        intId: task.intId, strTitle: task.strTitle, intIdDone: task.intIdDone));
  }

  @override
  Future<List<Task>> getTasks() async => await taskLocalDataSource.getTasks();

  @override
  Future<void> updateTask(Task task) async {
    await taskLocalDataSource.updateTask(TaskModel(
        intId: task.intId, strTitle: task.strTitle, intIdDone: task.intIdDone));
  }
}
