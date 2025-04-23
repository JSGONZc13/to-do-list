import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Tasks/domain/entities/task.dart';
import 'package:to_do_list_app/Tasks/presentation/provider/task_provider.dart';

class TaskPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    void addTask() {
      provider.addTask(Task(strTitle: controller.text));
      controller.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      addTask();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(provider.tasks[i].strTitle ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
