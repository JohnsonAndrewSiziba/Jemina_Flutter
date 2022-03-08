// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

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
  int index = 1;
  double value = 0;

  final navBarItems = <Widget>[
    Icon(Icons.person_outline),
    Icon(Icons.chrome_reader_mode_outlined),
    Icon(Icons.home_outlined),
    Icon(Icons.business_center_outlined),
    Icon(Icons.pie_chart_outline),
  ];

  // final screens = [
  //   AccountPage(onOpenMenu: toggleMenu()),
  //   ReportsPage(),
  //   TradingPage(),
  //   CountersPage(),
  //   StatsPage(),
  // ];

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
                buttonBackgroundColor: lightBackground,
                items: navBarItems,
                height: 50.0,
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
                /// sudenav
                /// sudenav
                /// sudenav
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        jeminaBlue,
                        // lightBackground.withOpacity(0.7),
                        techBlue
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
                    child: Column(
                      children: [
                        DrawerHeader(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage(
                                  "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Eren Yeager!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Favorites',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () => null,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Notifications',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () => null,
                              ),
                              Divider(
                                color: lightBackground,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () => null,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.description,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Policies',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () => null,
                              ),
                              Divider(
                                color: lightBackground,
                              ),
                              ListTile(
                                title: Text(
                                  'Exit',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                onTap: () => null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // main screen
                // main screen
                // main screen
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: value),
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    builder: (_, double val, __) {
                      return (Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..setEntry(0, 3, 200 * val)
                          ..rotateY((pi / 6) * val),
                        child: Scaffold(
                          body: [
                            AccountPage(onOpenMenu: toggleMenu),
                            ReportsPage(),
                            TradingPage(),
                            CountersPage(),
                            StatsPage(),
                          ][index],
                        ),
                      ));
                    }),

                //// Opening the drawer
                //// Opening the drawer
                //// Opening the drawer
                ///
                GestureDetector(
                  // onTap: () {
                  //   setState(() {
                  //     value == 0 ? value = 1 : value = 0;
                  //   });
                  // },
                  onHorizontalDragUpdate: (e) {
                    if (e.delta.dx > 0) {
                      setState(() {
                        value = 1;
                      });
                    } else {
                      setState(() {
                        value = 0;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
