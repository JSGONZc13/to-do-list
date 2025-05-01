import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/application/repositories/task_repository.dart';

class DelTask {
  final TaskRepository taskRepository;

  DelTask(this.taskRepository);

  Future<void> call(Task task) async => await taskRepository.delTask(task);
}
