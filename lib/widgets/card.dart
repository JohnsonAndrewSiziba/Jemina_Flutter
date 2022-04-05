import 'package:flutter/material.dart';

import '../data/constants/values.dart';

Widget card(
    {double width = double.infinity,
      double padding = 20,
      required Widget child}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(defaultBorderRadius),
      ),
    ),
    child: child,
  );
}