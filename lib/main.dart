import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/routes.dart';
import 'package:todo_app/utils/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ToDo App',
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.getHomeRoute(),
        getPages: Routes.routes);
  }
}
