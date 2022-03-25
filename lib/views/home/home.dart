// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/account/account_page.dart';
import 'package:jemina_capital/views/home/counters/counters_page.dart';
import 'package:jemina_capital/views/home/landing/landing_page.dart';
import 'package:jemina_capital/views/home/news/news_page.dart';
import 'package:jemina_capital/views/home/reports/reports_page.dart';
import 'package:jemina_capital/views/home/stats/stats_page.dart';

import '../../widgets/side_navigation_items.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;
  double value = 0;

  final navBarItems = <Widget>[
    // Icon(Icons.person_rounded),
    Icon(Icons.pie_chart_outline),
    Icon(Icons.history_edu_outlined),
    Icon(Icons.home_outlined),
    Icon(Icons.business_center_outlined),
    Icon(Icons.chrome_reader_mode_outlined),
  ];

  void toggleMenu() {
    setState(() {
      value == 0 ? value = 1 : value = 0;
    });
  }

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
                buttonBackgroundColor: scaffoldBackgroundColor,
                items: navBarItems,
                height: 45.0,
                animationDuration: Duration(milliseconds: 80),
                animationCurve: Curves.easeInOut,
                index: index,
                onTap: (index) => setState(() => this.index = index),
                backgroundColor: techBlue,
              ),
            ),
            // body: screens[index],
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        techBlue,
                        jeminaBlue,
                        grayBackground,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    width: 200.0,
                    padding: EdgeInsets.all(8.0),
                    child: SideNavigationItems(),
                  ),
                ),

                // main screen
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: value),
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    builder: (_, double val, __) {
                      return (Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..setEntry(0, 3, 200 * val)
                          ..rotateY((pi / 6) * val),
                        child: Container(
                          child: [
                            StatsPage(onOpenMenu: toggleMenu, state: value),
                            ReportsPage(onOpenMenu: toggleMenu, state: value),
                            LandingPage(onOpenMenu: toggleMenu, state: value),
                            CountersPage(onOpenMenu: toggleMenu, state: value),
                            NewsPage(onOpenMenu: toggleMenu, state: value),
                          ][index],
                        ),
                      ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
