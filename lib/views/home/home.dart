// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/account/account_page.dart';
import 'package:jemina_capital/views/home/counters/counters_page.dart';
import 'package:jemina_capital/views/home/reports/reports_page.dart';
import 'package:jemina_capital/views/home/stats/stats_page.dart';
import 'package:jemina_capital/views/home/trading/trading_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;

  final navBarItems = <Widget>[
    Icon(Icons.person_outline),
    Icon(Icons.chrome_reader_mode_outlined),
    Icon(Icons.home_outlined),
    Icon(Icons.business_center_outlined),
    Icon(Icons.pie_chart_outline),
  ];

  final screens = [
    AccountPage(),
    ReportsPage(),
    TradingPage(),
    CountersPage(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grayBackground,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  // color: Colors.black.withOpacity(.5),
                  color: techBlue,
                ),
              ),
              child: CurvedNavigationBar(
                color: grayBackground,
                buttonBackgroundColor: lightBackground,
                items: navBarItems,
                height: 50.0,
                animationDuration: Duration(milliseconds: 300),
                animationCurve: Curves.easeInOut,
                index: index,
                onTap: (index) => setState(() => this.index = index),
                backgroundColor: techBlue,
              ),
            ),
            body: screens[index],
          ),
        ),
      ),
    );
  }
}
