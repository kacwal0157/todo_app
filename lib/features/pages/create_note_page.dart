import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/constants/constant_variables.dart';
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
        onPressed: () => Get.back(),
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getIconButton(
                  onPressed: () {
                    print('make favourite');
                  },
                  iconData: Icons.star_border_outlined,
                ),
                getIconButton(
                  onPressed: () {
                    print('make special');
                  },
                  iconData: Icons.bookmark_border_rounded,
                ),
                getIconButton(
                  onPressed: () {
                    print('make important');
                  },
                  iconData: Icons.announcement_outlined,
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
                      maxLines: 1,
                      expands: false,
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: getTextField(
                        controller: contentController,
                        labelText: 'Note Content',
                        hintText: AppManager.defaultNote.noteContent,
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
                print('save note if correct');
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
