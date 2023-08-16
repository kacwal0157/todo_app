import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/models/note.dart';
import 'package:todo_app/features/services/user_btn_service.dart';

class IconBtn extends StatefulWidget {
  const IconBtn(
      {required this.iconType,
      required this.iconData,
      required this.note,
      required this.state,
      super.key});

  final IconType iconType;
  final IconData iconData;
  final Note note;
  final bool state;

  @override
  State<IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    iconColor = getIconColor(widget.state, widget.iconType, iconColor);

    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => _getAlertDialog(widget.iconType, context),
      ),
      icon: Icon(
        widget.iconData,
        color: iconColor,
        size: 25,
      ),
    );
  }

  _getAlertDialog(IconType iconType, BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            _getAction(iconType);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
          child: const Text("Yes"),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide.none),
          ),
          child: const Text(
            "No",
            style: TextStyle(color: secondaryColor),
          ),
        ),
      ],
      content: Container(
        width: 300,
        height: 70,
        padding: const EdgeInsets.all(10),
        child: Text(
          getAlertText(iconType),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  _getAction(IconType iconType) async {
    Color newColor = Colors.grey;

    switch (iconType) {
      case IconType.delete:
        await deleteNote(widget.note);
        break;
      case IconType.favourite:
        newColor = iconColor == Colors.grey ? Colors.yellow : Colors.grey;
        bool isFavourite = iconColor == Colors.grey ? true : false;
        await setNoteFavourite(note: widget.note, isFavourite: isFavourite);
        break;
      case IconType.mark:
        break;
      case IconType.important:
        newColor = iconColor == Colors.grey ? Colors.red : Colors.grey;
        bool isImportant = iconColor == Colors.grey ? true : false;
        await setNoteImportant(widget.note, isImportant);
        break;
      default:
        break;
    }

    setState(() {
      iconColor = newColor;
    });
  }
}
