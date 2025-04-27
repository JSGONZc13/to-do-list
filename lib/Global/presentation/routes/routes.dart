import 'package:flutter/material.dart';
import 'package:to_do_list_app/Company/presentation/company_page.dart';
import 'package:to_do_list_app/Tasks/presentation/pages/task_page.dart';
import 'package:to_do_list_app/Weather/presentation/pages/weather_page.dart';

final List<Map<String, Object?>> pages = [
  {
    'path': '/tasks',
    'label': 'Tasks',
    'iconActive': Icons.task,
    'iconInactive': Icons.task_outlined,
    'page': const TaskPage()
  },
  {
    'path': '/weather',
    'label': 'Weather',
    'iconActive': Icons.cloud,
    'iconInactive': Icons.cloud_outlined,
    'page': const WeatherPage()
  },
  {
    'path': '/company',
    'label': 'Company',
    'iconActive': Icons.business,
    'iconInactive': Icons.business_outlined,
    'page': const CompanyPage()
  },
  {
    'path': '/profile',
    'label': 'Profile',
    'iconActive': Icons.person,
    'iconInactive': Icons.person_outline,
    'page': null
  }
];

//RENDERER ROUTE SIMULATION (OUTLET)
Widget renderRoute(String path) {
  final page = pages.firstWhere(
    (page) => page['path'] == path,
    orElse: () => {},
  );

  if (page.isNotEmpty && page['page'] != null) {
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
