import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/components/inputs.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';
import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/presentation/provider/task_provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final taskProvider = context.read<TaskProvider>();
    taskProvider.getTasks();
  }

  void addTask(TaskProvider provider) {
    if (controller.text.isNotEmpty) {
      provider.addTask(Task(strTitle: controller.text));
      controller.clear();
    }
  }

  void delTask(TaskProvider provider, Task task) {
    provider.delTask(task);
  }

  void updateTask(TaskProvider provider, Task task) {
    provider.updateTask(task);
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return Scaffold(
      backgroundColor: cWhite,
      body: Padding(
        padding: const EdgeInsets.all(smlRadius),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (_, i) => CustomCard(
                  color:
                      taskProvider.tasks[i].intIdDone == 1 ? cSuccess : cGrey,
                  children: [
                    Text(
                      taskProvider.tasks[i].strTitle ?? '',
                      style: h6Font.copyWith(
                        color: taskProvider.tasks[i].intIdDone == 1
                            ? cWhite
                            : cBlack,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        taskProvider.tasks[i].intIdDone == 0
                            ? CustomIconButton(
                                variant: 'secondary',
                                color: cSecondary,
                                onPressed: () {
                                  updateTask(
                                      taskProvider, taskProvider.tasks[i]);
                                },
                                icon: const Icon(Icons.check),
                              )
                            : const SizedBox.shrink(),
                        CustomIconButton(
                          variant: 'secondary',
                          color: taskProvider.tasks[i].intIdDone == 1
                              ? cWhite
                              : cError,
                          onPressed: () =>
                              delTask(taskProvider, taskProvider.tasks[i]),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(smlRadius),
              child: Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      controller: controller,
                      onSubmitted: (value) => addTask(taskProvider),
                    ),
                  ),
                  const SizedBox(width: medRadius),
                  CustomIconButton(
                    variant: 'action',
                    icon: const Icon(Icons.add),
                    onPressed: () => addTask(taskProvider),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
