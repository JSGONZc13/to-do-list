import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
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
    final provider = Provider.of<TaskProvider>(context);

    void addTask() {
      if (controller.text.isNotEmpty) {
        provider.addTask(Task(strTitle: controller.text));
        controller.clear();
      }
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(smlRadius),
                        ),
                        color: cGrey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: medRadius, vertical: medRadius),
                            child: Row(
                              children: [
                                Text(
                                  provider.tasks[i].strTitle.toString(),
                                  style: pFont,
                                ),
                                const Spacer(),
                                const Icon(Icons.check_circle_outline),
                              ],
                            )))),
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
                      onPressed: () {
                        addTask();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
