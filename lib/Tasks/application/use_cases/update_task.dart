import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository taskRepository;
  UpdateTask(this.taskRepository);
  Future<void> call(Task task) async => await taskRepository.updateTask(task);
}