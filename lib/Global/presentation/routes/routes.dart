import 'package:flutter/material.dart';
import 'package:to_do_list_app/Tasks/presentation/pages/task_page.dart';

final pages = [
  {
    'path': '/tasks',
    'label': 'Tasks',
    'iconActive': Icons.task,
    'iconInactive': Icons.task_outlined,
    'page': TaskPage()
  },
  {
    'path': '/weather',
    'label': 'Weather',
    'iconActive': Icons.cloud,
    'iconInactive': Icons.cloud_outlined,
    'page': null
  }
];

//RENDERER ROUTE SIMULATION (OUTLET)
Widget renderRoute(String path) {
  final page =
      pages.firstWhere((page) => page['path'] == path, orElse: () => {});
  if (page['page'] != null) {
    return page['page'] as Widget;
  } else {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('404 Page Not Found'),
      ),
    );
  }
}
