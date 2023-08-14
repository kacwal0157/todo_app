import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';

enum IconType {
  delete,
  favourite,
  important,
  mark,
}

class IconBtn extends StatefulWidget {
  const IconBtn({required this.iconType, required this.iconData, super.key});

  final IconType iconType;
  final IconData iconData;

  @override
  State<IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
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
          _getAlertText(iconType),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  String _getAlertText(IconType iconType) {
    String text = '';

    switch (iconType) {
      case IconType.delete:
        text = 'Do you want to remove your note?';
        break;
      case IconType.favourite:
        text = 'Do you want to make this note favourite?';
        break;
      case IconType.mark:
        text = 'Do you want to mark this note?';
        break;
      case IconType.important:
        text = 'Do you want to make this note important?';
        break;
      default:
        text = 'ERROR';
        break;
    }

    return text;
  }

  _getAction(IconType iconType) {
    Color newColor = Colors.grey;

    switch (iconType) {
      case IconType.delete:
        break;
      case IconType.favourite:
        newColor = iconColor == Colors.grey ? Colors.yellow : Colors.grey;
        break;
      case IconType.mark:
        break;
      case IconType.important:
        newColor = iconColor == Colors.grey ? Colors.red : Colors.grey;
        break;
      default:
        break;
    }

    setState(() {
      iconColor = newColor;
    });
  }
}
