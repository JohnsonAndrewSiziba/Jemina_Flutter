// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/company.dart';
import 'package:jemina_capital/theme/colors.dart';
import 'package:jemina_capital/theme/padding.dart';
import 'package:jemina_capital/widgets/go_to_profile.dart';

class ViewCounter extends StatefulWidget {
  Company company;
  ViewCounter({Key? key, required this.company}) : super(key: key);

  @override
  State<ViewCounter> createState() => _ViewCounterState();
}

class _ViewCounterState extends State<ViewCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.only(
          left: appPadding, right: appPadding, bottom: appPadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topPiceAndChange(),
          ],
        ),
      ),
    );
  }

  Center topPiceAndChange() {
    return Center(
      child: Column(
        children: [
          Text(
            "\$31.23",
            style: TextStyle(
              color: secondary,
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
              fontFamily: GoogleFonts.bitter().fontFamily,
            ),
          ),
          SizedBox(height: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward,
                color: successGreen,
                size: 16.0,
              ),
              SizedBox(width: 5.0),
              Text(
                "2.05%",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: successGreen,
                  fontFamily: GoogleFonts.bitter().fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColorLight,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      centerTitle: true,
      title: Text(
        widget.company.name ?? 'Counter',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: darkGreyBlue),
      ),
      actions: [
        GotoProfile(),
      ],
    );
  }
}
