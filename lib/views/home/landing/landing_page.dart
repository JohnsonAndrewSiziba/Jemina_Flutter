// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/views/home/landing/components/top_marquee.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../widgets/go_to_profile.dart';


class LandingPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  LandingPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brightGrey,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopMarquee(),
            Text("Hello, World"),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: jeminaGrey,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          widget.onOpenMenu();
          setState(() {
            widget.state == 0 ? widget.state = 1 : widget.state = 0;
          });
        },
        icon: SvgPicture.asset("assets/icons/menu.svg", color: darkGreyBlue,),
      ),
      title: Text("Jemina Capital", style: TextStyle(color: darkGreyBlue),),
      actions: [
        GotoProfile(),
      ],
    );
  }
}
