import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_variables.dart';

class ColorBoxWidget extends StatelessWidget {
  const ColorBoxWidget(
      {required this.textTheme,
      required this.boxColor,
      required this.boxTitle,
      super.key});

  final TextTheme textTheme;
  final Color boxColor;
  final String boxTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor,
            ),
            child: Icon(Icons.bookmark_border_rounded, color: boxColor),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  boxTitle,
                  style: textTheme.headlineSmall!.apply(color: boxColor),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '0 Notes',
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
