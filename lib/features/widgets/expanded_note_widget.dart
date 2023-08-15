import 'package:flutter/material.dart';
import 'package:todo_app/app_manager.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/utils/components/user_icon_btn.dart';

class ExpandedNoteWidget extends StatefulWidget {
  const ExpandedNoteWidget(
      {required this.textTheme,
      required this.icon,
      required this.iconType,
      required this.noteName,
      required this.size,
      super.key});

  final TextTheme textTheme;
  final IconData icon;
  final IconType iconType;
  final String noteName;
  final Size size;

  @override
  State<ExpandedNoteWidget> createState() => _ExpandedNoteWidgetState();
}

class _ExpandedNoteWidgetState extends State<ExpandedNoteWidget> {
  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _getIconInfo(widget.iconType);
          AppManager.mainPageCallback();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: backgroundColor),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  widget.icon,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              const SizedBox(
                height: defaultSize,
              ),
              Text(
                widget.noteName,
                style: widget.textTheme.headlineSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getIconInfo(IconType iconType) {
    Color newColor = iconColor;
    switch (iconType) {
      case IconType.favourite:
        newColor = iconColor == Colors.black ? Colors.yellow : Colors.black;
        AppManager.showFavourites = !AppManager.showFavourites;
        break;
      case IconType.important:
        newColor = iconColor == Colors.black ? Colors.red : Colors.black;
        AppManager.showImportant = !AppManager.showImportant;
        break;
      default:
        break;
    }

    setState(() {
      iconColor = newColor;
    });
  }
}
