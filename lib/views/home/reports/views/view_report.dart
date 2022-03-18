// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../../../widgets/notification_icon.dart';

class ViewReport extends StatefulWidget {
  ViewReport({Key? key}) : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: techBlue,
        title: const Text("Report Title"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: NotificationsIcon(),
          ),
        ],
      ),
    );
  }
}
