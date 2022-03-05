// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("StatsPage"),
    );
  }
}
