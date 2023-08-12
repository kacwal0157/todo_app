import 'package:flutter/material.dart';

class ColorBoxData {
  final Color color;
  final String title;

  ColorBoxData({required this.color, required this.title});
}

List<ColorBoxData> colorBoxData = [
  ColorBoxData(color: Colors.yellow, title: 'Yellow Notes'),
  ColorBoxData(color: Colors.green, title: 'Green Notes'),
  ColorBoxData(color: Colors.blue, title: 'Blue Notes'),
  ColorBoxData(color: Colors.red, title: 'Red Notes'),
];
