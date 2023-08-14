import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/services/note_json_service.dart';
import 'package:path/path.dart' as path;

Future<List<Note>> loadNotes(List<Note> notes) async {
  final directory = await getApplicationDocumentsDirectory();
  final notesFolder = '${directory.path}/notes';

  try {
    final files = await Directory(notesFolder).list().toList();
    for (var file in files) {
      if (path.extension(file.path) == '.json') {
        String fileName = path.basename(file.path);
        Note note = await loadNoteFromJson(
            noteFileName: fileName.replaceAll('.json', ''),
            folderPath: notesFolder);
        notes.add(note);
      }
    }
  } catch (e) {
    debugPrint('Error loading notes: $e');
  }

  return notes;
}
