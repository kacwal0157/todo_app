import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/services/note_json_service.dart';
import 'package:path/path.dart' as path;

const String defaultNoteName = 'default_note';

Future<void> loadNotes() async {
  AppManager.notes.clear();
  final notesFolder = await _getDocumentDirectory();

  if (AppManager.defaultNote.noteTitle == '') {
    AppManager.defaultNote =
        await loadNoteFromJson(noteFileName: defaultNoteName);
  }

  try {
    final files = await Directory(notesFolder).list().toList();
    for (var file in files) {
      if (path.extension(file.path) == '.json') {
        String fileName = path.basename(file.path);
        Note note = await loadNoteFromJson(
          noteFileName: fileName.replaceAll('.json', ''),
          folderPath: notesFolder,
        );
        AppManager.notes.add(note);
      }
    }
  } catch (e) {
    debugPrint('Error loading notes: $e');
  }
}

Future<void> deleteNoteFromFiles(Note note) async {
  final notesFolder = await _getDocumentDirectory();

  try {
    String noteFileName = '${note.noteTitle.replaceAll(' ', '_')}.json';
    String noteFilePath = path.join(notesFolder, noteFileName);

    var noteFile = File(noteFilePath);
    if (await noteFile.exists()) {
      await noteFile.delete();
    }
  } catch (e) {
    debugPrint('Error deleting note: $e');
  }
}

_getDocumentDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/notes';
}

Future<void> saveNote(
    String title, String content, bool isFavourite, bool isImportant) async {
  final notesDirectory = await getApplicationDocumentsDirectory();
  final notesFolder = Directory('${notesDirectory.path}/notes');
  if (!await notesFolder.exists()) {
    await notesFolder.create();
  }

  final note = Note(
    noteTitle: title,
    noteContent: content,
    specialSignature: SpecialSignature(
      favourite: isFavourite,
      important: isImportant,
      marked: ['marked'],
    ),
  );
  final noteJson = json.encode(note.toJson());

  final noteFile =
      File('${notesFolder.path}/${note.noteTitle.replaceAll(' ', '_')}.json');
  await noteFile.writeAsString(noteJson);

  await loadNotes();
}

Future<bool> doesNoteExistInFiles(String noteTitle) async {
  final notesFolder = await _getDocumentDirectory();

  try {
    String noteFileName = '${noteTitle.replaceAll(' ', '_')}.json';
    String noteFilePath = path.join(notesFolder, noteFileName);

    var noteFile = File(noteFilePath);
    return await noteFile.exists();
  } catch (e) {
    debugPrint('Error checking note existence: $e');
    return false;
  }
}
