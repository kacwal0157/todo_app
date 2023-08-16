import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/services/create_note_service.dart';
import 'package:todo_app/utils/components/app_bar.dart';
import 'package:todo_app/utils/components/elevated_btn.dart';
import 'package:todo_app/utils/components/text_field.dart';
import 'package:todo_app/utils/components/user_icon_btn.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String? titleError;
  String? contentError;

  void _updateErrors(String? titleError, String? contentError) {
    setState(() {
      this.titleError = titleError;
      this.contentError = contentError;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        iconData: Icons.arrow_back_rounded,
        title: 'New Note',
        onPressed: () {
          AppManager.isNoteFavourite = false;
          AppManager.isNoteImportant = false;

          Get.back();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconBtn(
                  iconType: IconType.favourite,
                  iconData: Icons.star_border_outlined,
                  note: AppManager.defaultNote,
                  state: AppManager.isNoteFavourite,
                ),
                /*IconBtn(
                  iconType: IconType.mark,
                  iconData: Icons.bookmark_border_rounded,
                  note: AppManager.defaultNote,
                  state: false,
                ),*/ //* TO BE DEVELOPED
                IconBtn(
                  iconType: IconType.important,
                  iconData: Icons.announcement_outlined,
                  note: AppManager.defaultNote,
                  state: AppManager.isNoteImportant,
                ),
              ],
            ),
            const SizedBox(
              height: defaultSize,
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    getTextField(
                      controller: titleController,
                      labelText: 'Note Title',
                      hintText: AppManager.defaultNote.noteTitle,
                      errorMessage: titleError,
                      maxLines: 1,
                      expands: false,
                    ),
                    const SizedBox(height: defaultSize),
                    Flexible(
                      child: getTextField(
                        controller: contentController,
                        labelText: 'Note Content',
                        hintText: AppManager.defaultNote.noteContent,
                        errorMessage: contentError,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: defaultSize,
            ),
            getElevatedBtn(
              onPressed: () {
                validateNewNote(
                    titleController, contentController, _updateErrors);
              },
              child: const Text('Save Note'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
