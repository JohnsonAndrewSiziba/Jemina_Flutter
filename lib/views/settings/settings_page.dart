// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/theme/padding.dart';
import 'package:jemina_capital/widgets/custom_placeholder.dart';
import 'package:jemina_capital/widgets/custom_title.dart';
import 'package:jemina_capital/widgets/go_to_profile.dart';

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
      backgroundColor: kPrimaryColorLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColorLight,
        title: Text(
          'Settings',
          style: TextStyle(color: darkGreyBlue),
        ),
        iconTheme: IconThemeData(color: darkGreyBlue),
        actions: [
          GotoProfile(),
        ],
      ),
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.all(appPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTitle(
              title: "Security",
              extend: false,
            ),
            SizedBox(height: 10.0),
            CunstomPlaceHolder(
              title: "Change Password",
              isSwitch: false,
            ),
            CunstomPlaceHolder(
              title: "Change Email",
              isSwitch: false,
            ),
            SizedBox(height: smallSpacer),
            CustomTitle(
              title: "Notifications",
              extend: false,
            ),
            SizedBox(height: 10.0),
            CunstomPlaceHolder(
              title: "Email Notifications",
              isSwitch: true,
            ),
            CunstomPlaceHolder(
              title: "Price Sheets",
              isSwitch: true,
            ),
            CunstomPlaceHolder(
              title: "Order Matched Notification",
              isSwitch: true,
            ),
            CunstomPlaceHolder(
              title: "Order Expired Notification",
              isSwitch: true,
            ),
            CunstomPlaceHolder(
              title: "Market Status Notification",
              isSwitch: true,
            ),
          ],
        ),
      ),
    );
  }
}
