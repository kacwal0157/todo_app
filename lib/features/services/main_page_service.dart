import 'package:flutter/material.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/widgets/user_note_widget.dart';

List<Widget> generateUserNoteWidgets(
    List<Note> notes, BuildContext context, TextTheme textTheme) {
  final List<Widget> widgets = [];

  for (var note in notes) {
    if (note.specialSignature.favourite &&
        note.specialSignature.important &&
        AppManager.showFavourites &&
        AppManager.showImportant) {
      widgets.add(
        UserNoteWidget(
          textTheme: textTheme,
          title: note.noteTitle,
          note: note,
        ),
      );
    } else if (note.specialSignature.favourite &&
        note.specialSignature.important == false &&
        AppManager.showFavourites &&
        AppManager.showImportant == false) {
      widgets.add(
        UserNoteWidget(
          textTheme: textTheme,
          title: note.noteTitle,
          note: note,
        ),
      );
    } else if (note.specialSignature.important &&
        note.specialSignature.favourite == false &&
        AppManager.showImportant &&
        AppManager.showFavourites == false) {
      widgets.add(
        UserNoteWidget(
          textTheme: textTheme,
          title: note.noteTitle,
          note: note,
        ),
      );
    } else if (AppManager.showFavourites == false &&
        AppManager.showImportant == false) {
      widgets.add(
        UserNoteWidget(
          textTheme: textTheme,
          title: note.noteTitle,
          note: note,
        ),
      );
    }
  }

  return widgets;
}
