// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../widgets/notification_icon.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: brightGrey,
        title: Text('Settings', style: TextStyle(color: darkGreyBlue),),
        iconTheme: IconThemeData(color: darkGreyBlue),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: NotificationsIcon(),
          ),
        ],
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
