import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:todo_app/features/models/note.dart';

Future<Note> loadNoteFromJson(String noteFileName) async { 
  final jsonStr = await rootBundle.loadString('assets/json/$noteFileName.json');
  final jsonData = json.decode(jsonStr);
  return Note.fromJson(jsonData);
}
