// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

class ReportsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;

  ReportsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: scaffoldBackgroundColor,
        title: Text(
          "News and Reports",
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
            icon: const Icon(Icons.notifications),
            color: techBlue,
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No notifications')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Icon"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
