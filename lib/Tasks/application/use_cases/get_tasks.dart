import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/application/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository taskRepository;
  GetTasks(this.taskRepository);
  Future<List<Task>> call() async => await taskRepository.getTasks();
}
