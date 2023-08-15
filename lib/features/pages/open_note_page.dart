import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/utils/components/app_bar.dart';

class OpenNotePage extends StatelessWidget {
  const OpenNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final note = args['note'] as Note;

    return Scaffold(
      appBar: getAppBar(
        context: context,
        iconData: Icons.arrow_back_rounded,
        title: note.noteTitle,
        onPressed: () => Get.back(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(defaultPadding + 20),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: secondaryColor)),
          child: Text(
            note.noteContent,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
