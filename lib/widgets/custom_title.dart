// ignore_for_file: unused_import

import '../theme/colors.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({
    Key? key,
    required this.title,
    this.route = '/404',
    this.extend = true,
    this.fontSize = 20.0,
    this.arg,
    this.color = secondary,
  }) : super(key: key);

  final String title;
  final String route;
  final bool extend;
  final double fontSize;
  final arg;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        (extend)
            ? GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   route,
                  //   arguments: arg,
                  // );
                },
                child: Text(
                  'See More',
                  style: TextStyle(
                      color: primary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              )
            : Container(),
      ],
    );
  }
}
