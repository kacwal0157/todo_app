import 'package:flutter/material.dart';
import 'package:todo_app/features/models/note.dart';

class AppManager {
  AppManager._();

  //*NOTES
  static Note defaultNote = Note(
      noteTitle: '.null',
      noteContent: 'noteContent',
      specialSignature:
          SpecialSignature(favourite: false, important: false, marked: []));
  static List<Note> notes = [];
  static bool isNoteFavourite = false;
  static bool isNoteImportant = false;

  //*CALLBACK
  static VoidCallback mainPageCallback = () {};
}
