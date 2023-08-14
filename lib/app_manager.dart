import 'package:todo_app/features/models/note.dart';

class AppManager {
  AppManager._();

  //*NOTES
  static Note defaultNote = Note(
      noteTitle: 'noteTitle',
      noteContent: 'noteContent',
      specialSignature:
          SpecialSignature(favourite: false, important: false, marked: []));
  static List<Note> notes = [];
}
