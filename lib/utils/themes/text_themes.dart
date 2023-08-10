import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headlineSmall:
        TextStyle(fontFamily: 'Barlow', fontSize: 16.0, color: Colors.black),
    headlineMedium:
        TextStyle(fontFamily: 'Barlow', fontSize: 24.0, color: Colors.black),
    headlineLarge:
        TextStyle(fontFamily: 'Barlow', fontSize: 32.0, color: Colors.black),
    bodySmall:
        TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black),
    bodyMedium:
        TextStyle(fontFamily: 'Poppins', fontSize: 24.0, color: Colors.black),
    bodyLarge:
        TextStyle(fontFamily: 'Poppins', fontSize: 32.0, color: Colors.black),
  );
  static TextTheme darkTextTheme = const TextTheme(
    headlineSmall:
        TextStyle(fontFamily: 'Barlow', fontSize: 16.0, color: Colors.white),
    headlineMedium:
        TextStyle(fontFamily: 'Barlow', fontSize: 24.0, color: Colors.white),
    headlineLarge:
        TextStyle(fontFamily: 'Barlow', fontSize: 32.0, color: Colors.white),
    bodySmall:
        TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.white),
    bodyMedium:
        TextStyle(fontFamily: 'Poppins', fontSize: 24.0, color: Colors.white),
    bodyLarge:
        TextStyle(fontFamily: 'Poppins', fontSize: 32.0, color: Colors.white),
  );
}
