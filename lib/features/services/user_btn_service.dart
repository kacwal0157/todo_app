import 'package:todo_app/app_manager.dart';
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
