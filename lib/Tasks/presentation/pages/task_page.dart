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
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..getTasks(),
      child: Consumer<TaskProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: cWhite,
          body: Padding(
            padding: const EdgeInsets.all(smlRadius),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.tasks.length,
                    itemBuilder: (_, i) => CustomCard(
                      color:
                          provider.tasks[i].intIdDone == 1 ? cSuccess : cGrey,
                      children: [
                        Text(
                          '${provider.tasks[i].strTitle}',
                          style: h6Font.copyWith(
                            color: provider.tasks[i].intIdDone == 1
                                ? cWhite
                                : cBlack,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            provider.tasks[i].intIdDone == 0
                                ? CustomIconButton(
                                    variant: 'secondary',
                                    color: cSecondary,
                                    onPressed: () {
                                      updateTask(provider, provider.tasks[i]);
                                    },
                                    icon: const Icon(Icons.check))
                                : const SizedBox.shrink(),
                            CustomIconButton(
                              variant: 'secondary',
                              color: provider.tasks[i].intIdDone == 1
                                  ? cWhite
                                  : cError,
                              onPressed: () =>
                                  delTask(provider, provider.tasks[i]),
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
                          onSubmitted: (value) => addTask(provider),
                        ),
                      ),
                      const SizedBox(width: medRadius),
                      CustomIconButton(
                        variant: 'action',
                        icon: const Icon(Icons.add),
                        onPressed: () => addTask(provider),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
