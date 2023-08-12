import 'package:flutter/material.dart';

AppBar getAppBar(
        {required BuildContext context,
        required IconData iconData,
        required String title,
        required VoidCallback onPressed,
        bool? centerTitle}) =>
    AppBar(
      leading: IconButton(
        icon: Icon(iconData, color: Colors.black),
        onPressed: onPressed,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      centerTitle: centerTitle ?? true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
