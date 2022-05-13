// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../../data/constants/theme_colors.dart';
import '../../widgets/go_to_profile.dart';
import '../../widgets/notification_icon.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColorLight1,
        title: Text(
          'Notifications',
          style: TextStyle(color: darkGreyBlue),
        ),
        iconTheme: IconThemeData(color: darkGreyBlue),
        actions: [
          GotoProfile(),
        ],
      ),
      body: Center(
        child: Text('Notifications Page'),
      ),
    );
  }
}
