import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/services/note_service.dart';

validateNewNote(
  TextEditingController titleController,
  TextEditingController contentController,
  Function(String?, String?) updateErrors,
) {
  bool isTitleNotEmpty = titleController.text.isNotEmpty;
  bool isContentNotEmpty = contentController.text.isNotEmpty;

  if (isTitleNotEmpty && isContentNotEmpty) {
    _saveNote(titleController.text, contentController.text);
    updateErrors(null, null);
  } else if (isTitleNotEmpty == false && isContentNotEmpty) {
    updateErrors('Title is too short.', null);
  } else if (isTitleNotEmpty && isContentNotEmpty == false) {
    updateErrors(null, 'Content is too short.');
  } else {
    updateErrors('Title is too short.', 'Content is too short.');
  }
}

Future<void> _saveNote(String title, String content) async {
  final notesDirectory = await getApplicationDocumentsDirectory();
  final notesFolder = Directory('${notesDirectory.path}/notes');
  if (!await notesFolder.exists()) {
    await notesFolder.create();
  }

  final note = Note(
    noteTitle: title,
    noteContent: content,
    specialSignature: SpecialSignature(
      favourite: false,
      important: false,
      marked: ['marked'],
    ),
  );
  final noteJson = json.encode(note.toJson());

  final noteFile =
      File('${notesFolder.path}/${DateTime.now().millisecondsSinceEpoch}.json');
  await noteFile.writeAsString(noteJson);

  await loadNotes(AppManager.notes);
  Get.back();
}
