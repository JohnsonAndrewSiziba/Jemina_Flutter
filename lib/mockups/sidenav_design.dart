// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class SidenavDesign extends StatefulWidget {
  const SidenavDesign({Key? key}) : super(key: key);

  @override
  State<SidenavDesign> createState() => _SidenavDesignState();
}

class _SidenavDesignState extends State<SidenavDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: _onMenuTap(),
          child: Icon(
            Icons.list,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          // PDrawer()
        ],
      ),
    );
  }

  _onMenuTap() {}
}
