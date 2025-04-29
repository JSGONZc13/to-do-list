import 'package:flutter/material.dart';
import 'package:to_do_list_app/Evaluation/presentation/pages/modelo_page.dart';
import 'package:to_do_list_app/Global/presentation/pages/dashboard.dart';
import 'package:to_do_list_app/Tasks/presentation/pages/task_page.dart';
import 'package:to_do_list_app/Weather/presentation/pages/weather_page.dart';

class PageRoutes {
  static String initial = '/';
  static String tasks = '/tasks';
  static String weather = '/weather';
  static String models = '/models';
  static String profile = '/profile';
  static String addCompany = '/company/add';
}

final Routes = {
  // Gestión de rutas que no se manejan en el dashboard
  PageRoutes.initial: (context) => const Dashboard()
};

final List<Map<String, Object?>> pages = [
  {
    'path': PageRoutes.tasks,
    'label': 'Tasks',
    'iconActive': Icons.task,
    'iconInactive': Icons.task_outlined,
    'page': const TaskPage()
  },
  {
    'path': PageRoutes.weather,
    'label': 'Weather',
    'iconActive': Icons.cloud,
    'iconInactive': Icons.cloud_outlined,
    'page': const WeatherPage()
  },
  {
    'path': PageRoutes.models,
    'label': 'Models',
    'iconActive': Icons.calculate,
    'iconInactive': Icons.calculate_outlined,
    'page': const ModeloPage()
  },
  {
    'path': PageRoutes.profile,
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
