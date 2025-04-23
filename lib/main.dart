import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list_app/Global/presentation/pages/dashboard.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
// ignore: unused_import
import 'package:to_do_list_app/Tasks/presentation/pages/task_page.dart';
import 'package:to_do_list_app/Tasks/presentation/provider/task_provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..getTasks(),
      child: const MaterialApp(home: Dashboard()),
    );
  }
}
