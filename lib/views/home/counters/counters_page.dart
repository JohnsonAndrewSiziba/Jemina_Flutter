// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CountersPage extends StatefulWidget {
  CountersPage({Key? key}) : super(key: key);

  @override
  State<CountersPage> createState() => _CountersPageState();
}

class _CountersPageState extends State<CountersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("CountersPage"),
    );
  }
}
