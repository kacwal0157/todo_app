import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:todo_app/features/models/note.dart';

const String assetPath = 'assets/json';

Future<Note> loadNoteFromJson(
    {required String noteFileName, String? folderPath}) async {
  final file = File('$folderPath/$noteFileName.json');
  String jsonStr = '';

  if (await file.exists()) {
    jsonStr = await file.readAsString();
  } else {
    jsonStr = await rootBundle.loadString('$assetPath/$noteFileName.json');
  }

  final jsonData = json.decode(jsonStr);
  return Note.fromJson(jsonData);
}
