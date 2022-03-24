// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/news/view_news/components/news_body.dart';
import 'package:jemina_capital/widgets/notification_icon.dart';

class ViewNews extends StatelessWidget {
  const ViewNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: NewsBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: techBlue,
      title: Text("The Title"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: NotificationsIcon(),
        ),
      ],
    );
  }
}
