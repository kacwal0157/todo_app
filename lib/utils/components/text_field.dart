import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';

TextField getTextField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  int? minLines,
  int? maxLines,
  required bool expands,
}) =>
    TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      autocorrect: true,
      expands: expands,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: secondaryColor),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
