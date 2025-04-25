import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/pages/dashboard.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
// ignore: unused_import
import 'package:to_do_list_app/Tasks/presentation/pages/task_page.dart';
import 'package:to_do_list_app/Tasks/presentation/provider/task_provider.dart';
import 'package:to_do_list_app/Weather/presentation/provider/weather_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: cWhite,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: cWhite,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SystemProvider()),
      ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ChangeNotifierProvider(create: (_) => TaskProvider())
    ], child: const MaterialApp(home: Dashboard()));
  }
}
