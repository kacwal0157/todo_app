import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';

ElevatedButton getElevatedBtn(
        {required VoidCallback onPressed, required Widget child, required OutlinedBorder shape}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: shape,
        backgroundColor: secondaryColor,
        fixedSize: const Size.fromHeight(defaultSize * 2),
      ),
      child: child,
    );
