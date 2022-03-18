// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

class ReportTitle extends StatelessWidget {
  const ReportTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Report Title",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: [
                    Text("Buttons"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64.0,
            width: 64,
            child: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.download,
                size: 28,
                color: techBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
