import 'package:flutter/material.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/services/note_service.dart';

deleteNote(Note note) async {
  if (AppManager.notes.contains(note)) {
    AppManager.notes.removeWhere((element) => element == note);
    await deleteNoteFromFiles(note);

    AppManager.mainPageCallback();
  }
}

setNoteFavourite({Note? note, required bool isFavourite}) async {
  if (AppManager.notes.contains(note)) {
    await saveNote(note!.noteTitle, note.noteContent, isFavourite,
        note.specialSignature.important);
    AppManager.mainPageCallback();
  } else {
    AppManager.isNoteFavourite = !AppManager.isNoteFavourite;
  }
}

setNoteImportant(Note note, bool isImportant) async {
  if (AppManager.notes.contains(note)) {
    await saveNote(note.noteTitle, note.noteContent,
        note.specialSignature.favourite, isImportant);
    AppManager.mainPageCallback();
  } else {
    AppManager.isNoteImportant = !AppManager.isNoteImportant;
  }
}

getIconColor(bool state, IconType iconType, Color iconColor) {
  if (state) {
    switch (iconType) {
      case IconType.favourite:
        return Colors.yellow;
      case IconType.important:
        return Colors.red;
      default:
        return iconColor;
    }
  }

  return iconColor;
}

String getAlertText(IconType iconType) {
  String text = '';

  switch (iconType) {
    case IconType.delete:
      text = 'Do you want to remove your note?';
      break;
    case IconType.favourite:
      text = 'Do you want to make this note favourite?';
      break;
    case IconType.mark:
      text = 'Do you want to mark this note?';
      break;
    case IconType.important:
      text = 'Do you want to make this note important?';
      break;
    default:
      text = 'ERROR';
      break;
  }

  return text;
}
