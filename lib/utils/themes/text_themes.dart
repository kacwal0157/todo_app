import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headlineSmall: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 32.0,
        color: Colors.black,
        fontWeight: FontWeight.bold),
    bodySmall:
        TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black),
    bodyMedium:
        TextStyle(fontFamily: 'Poppins', fontSize: 24.0, color: Colors.black),
    bodyLarge:
        TextStyle(fontFamily: 'Poppins', fontSize: 32.0, color: Colors.black),
  );
  static TextTheme darkTextTheme = const TextTheme(
    headlineSmall: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
        fontFamily: 'Barlow',
        fontSize: 32.0,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    bodySmall:
        TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.white),
    bodyMedium:
        TextStyle(fontFamily: 'Poppins', fontSize: 24.0, color: Colors.white),
    bodyLarge:
        TextStyle(fontFamily: 'Poppins', fontSize: 32.0, color: Colors.white),
  );
}
