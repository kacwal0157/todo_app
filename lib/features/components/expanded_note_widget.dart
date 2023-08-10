import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';

class ExpandedNoteWidget extends StatelessWidget {
  const ExpandedNoteWidget(
      {required this.textTheme,
      required this.icon,
      required this.noteName,
      required this.size,
      super.key});

  final TextTheme textTheme;
  final IconData icon;
  final String noteName;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                icon,
                size: 30.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: defaultSize,
            ),
            Text(
              noteName,
              style: textTheme.headlineSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
