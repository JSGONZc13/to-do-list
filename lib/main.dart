import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Evaluation/presentation/providers/modelo_provider.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/routes/routes.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SystemProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ModeloProvider())
      ],
      child: MaterialApp(
        title: 'To Do List App',
        initialRoute: PageRoutes.initial, // Ruta inicial
        routes: Routes,
      ),
    );
  }
}
