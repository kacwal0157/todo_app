import 'package:flutter/material.dart';
import 'package:todo_app/utils/themes/text_themes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green.shade400,
    textTheme: AppTextTheme.lightTextTheme,
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.greenAccent.shade400,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
