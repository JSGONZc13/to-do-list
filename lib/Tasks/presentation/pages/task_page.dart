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

class TaskPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..getTasks(),
      child: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          void addTask() {
            if (controller.text.isNotEmpty) {
              provider.addTask(Task(strTitle: controller.text));
              controller.clear();
            }
          }

          void delTask(Task task) {
            provider.delTask(task);
          }

          void updateTask(Task task) {
            provider.updateTask(task);
          }

          return Scaffold(
            backgroundColor: cWhite,
            body: Padding(
              padding: const EdgeInsets.all(smlRadius),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.tasks.length,
                      itemBuilder: (_, i) => Card.filled(
                        shape: cardShape,
                        color:
                            provider.tasks[i].intIdDone == 1 ? cSuccess : cGrey,
                        child: Padding(
                          padding: cardPadding,
                          child: Row(
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
                                      ? IconButton(
                                          color: cSecondary,
                                          style: buttonActionStyle,
                                          onPressed: () {
                                            updateTask(provider.tasks[i]);
                                          },
                                          icon: const Icon(Icons.check))
                                      : const SizedBox.shrink(),
                                  IconButton(
                                      color: provider.tasks[i].intIdDone == 1
                                          ? cWhite
                                          : cError,
                                      style: buttonActionStyle,
                                      onPressed: () =>
                                          delTask(provider.tasks[i]),
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(smlRadius),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: textFieldDecoration,
                            style: pFont,
                          ),
                        ),
                        const SizedBox(width: medRadius),
                        IconButton.filled(
                          style: buttonStyle,
                          icon: const Icon(Icons.add),
                          onPressed: addTask,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
