import 'package:flutter/material.dart';

IconButton getIconButton(
        {required VoidCallback onPressed, required IconData iconData}) =>
    IconButton(
      alignment: Alignment.centerLeft,
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.grey,
        size: 25,
      ),
    );
