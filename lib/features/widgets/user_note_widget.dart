import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_images.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/utils/components/user_icon_btn.dart';

class UserNoteWidget extends StatefulWidget {
  const UserNoteWidget(
      {required this.textTheme, required this.title, super.key});

  final TextTheme textTheme;
  final String title;

  @override
  State<UserNoteWidget> createState() => _UserNoteWidgetState();
}

class _UserNoteWidgetState extends State<UserNoteWidget> {
  _refreshPage() {
    setState(() {});
  }

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
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconBtn(
                          iconType: IconType.favourite,
                          iconData: Icons.star_border_outlined),
                      IconBtn(
                          iconType: IconType.important,
                          iconData: Icons.announcement_outlined),
                      IconBtn(
                          iconType: IconType.delete,
                          iconData: Icons.delete_outline_rounded),
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
