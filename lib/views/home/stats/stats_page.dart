// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../data/constants/theme_colors.dart';

class StatsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  StatsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: scaffoldBackgroundColor,
        title: Text(
          "Market Statistics",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: (() {
            widget.onOpenMenu();
            setState(() {
              widget.state == 0 ? widget.state = 1 : widget.state = 0;
            });
          }),
          child: Icon(
            widget.state == 0 ? Icons.list_rounded : Icons.close_rounded,
            color: widget.state == 0 ? Colors.black : Colors.red,
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
      ),
      body: Text("StatsPage"),
    );
  }
}
