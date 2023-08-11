import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_images.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/utils/user_icon_btn.dart';

class UserNoteWidget extends StatefulWidget {
  const UserNoteWidget({required this.textTheme, super.key});

  final TextTheme textTheme;

  @override
  State<UserNoteWidget> createState() => _UserNoteWidgetState();
}

class _UserNoteWidgetState extends State<UserNoteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("open note");
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
                          'Note Title',
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
                      getIconButton(
                        onPressed: () {
                          print('make favourite');
                        },
                        iconData: Icons.star_border_outlined,
                      ),
                      getIconButton(
                        onPressed: () {
                          print('make important');
                        },
                        iconData: Icons.announcement_outlined,
                      ),
                      getIconButton(
                        onPressed: () {
                          print('delete');
                        },
                        iconData: Icons.delete_outline_rounded,
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
