// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TradingPage extends StatefulWidget {
  TradingPage({Key? key}) : super(key: key);

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TradingPage"),
    );
  }
}
