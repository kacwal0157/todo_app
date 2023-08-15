import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/features/services/note_service.dart';

validateNewNote(
  TextEditingController titleController,
  TextEditingController contentController,
  Function(String?, String?) updateErrors,
) async {
  bool isTitleNotEmpty = titleController.text.isNotEmpty;
  bool isContentNotEmpty = contentController.text.isNotEmpty;

  if (isTitleNotEmpty && isContentNotEmpty) {
    if (await doesNoteExistInFiles(titleController.text)) {
      updateErrors('Note with the same name exists.', null);
    } else {
      saveNote(titleController.text, contentController.text,
          AppManager.isNoteFavourite, AppManager.isNoteImportant);

      AppManager.isNoteFavourite = false;
      AppManager.isNoteImportant = false;

      updateErrors(null, null);
      Get.back();
    }
  } else if (isTitleNotEmpty == false && isContentNotEmpty) {
    updateErrors('Title is too short.', null);
  } else if (isTitleNotEmpty && isContentNotEmpty == false) {
    updateErrors(null, 'Content is too short.');
  } else {
    updateErrors('Title is too short.', 'Content is too short.');
  }
}
