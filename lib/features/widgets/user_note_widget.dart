import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constant_images.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/utils/components/user_icon_btn.dart';
import 'package:todo_app/utils/routes.dart';

class UserNoteWidget extends StatefulWidget {
  const UserNoteWidget(
      {required this.textTheme,
      required this.title,
      required this.note,
      super.key});

  final TextTheme textTheme;
  final String title;
  final Note note;

  @override
  State<UserNoteWidget> createState() => _UserNoteWidgetState();
}

class _UserNoteWidgetState extends State<UserNoteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.getOpenNotePageRoute(),
            arguments: {'note': widget.note});
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,
                          style: widget.textTheme.headlineSmall!
                              .apply(fontSizeFactor: 1.5),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Flexible(
                        child: Image(
                          image: AssetImage(noteImage),
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconBtn(
                        iconType: IconType.favourite,
                        iconData: Icons.star_border_outlined,
                        note: widget.note,
                        state: widget.note.specialSignature.favourite,
                      ),
                      IconBtn(
                        iconType: IconType.important,
                        iconData: Icons.announcement_outlined,
                        note: widget.note,
                        state: widget.note.specialSignature.important,
                      ),
                      IconBtn(
                        iconType: IconType.delete,
                        iconData: Icons.delete_outline_rounded,
                        note: widget.note,
                        state: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: defaultSize - 10,
          ),
        ],
      ),
    );
  }
}
