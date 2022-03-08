// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../data/constants/theme_colors.dart';

class PageAppBar extends StatefulWidget {
  VoidCallback onOpenMenu;
  String title;
  PageAppBar({Key? key, required this.onOpenMenu, required this.title})
      : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      backgroundColor: scaffoldBackgroundColor,
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black),
      ),
      leading: GestureDetector(
        onTap: (() {
          widget.onOpenMenu();
        }),
        child: Icon(
          Icons.list_rounded,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: techBlue,
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No notifications')));
          },
        ),
      ],
    );
  }
}
