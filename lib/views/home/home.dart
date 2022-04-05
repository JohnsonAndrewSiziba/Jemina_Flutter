// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/counters/counters_page.dart';
import 'package:jemina_capital/views/home/landing/landing_page.dart';
import 'package:jemina_capital/views/home/news/news_page.dart';
import 'package:jemina_capital/views/home/reports/reports_page.dart';
import 'package:jemina_capital/views/home/stats/stats_page.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;
  double value = 0;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  bool isOpened = false;

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  final navBarItems = <Widget>[
    // Icon(Icons.person_rounded),
    Icon(Icons.pie_chart_outline),
    Icon(Icons.history_edu_outlined),
    Icon(Icons.home_outlined),
    Icon(Icons.business_center_outlined),
    Icon(Icons.chrome_reader_mode_outlined),
  ];

  void toggleMenu1() {
    setState(() {
      value == 0 ? value = 1 : value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Container(
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
                    height: 55.0,
                    animationDuration: Duration(milliseconds: 80),
                    animationCurve: Curves.easeInOut,
                    index: index,
                    onTap: (index) => setState(() => this.index = index),
                    backgroundColor: techBlue,
                  ),
                ),
                body: IndexedStack(
                  children: <Widget>[
                    StatsPage(onOpenMenu: toggleMenu, state: value),
                    ReportsPage(onOpenMenu: toggleMenu, state: value),
                    LandingPage(onOpenMenu: toggleMenu, state: value),
                    CountersPage(onOpenMenu: toggleMenu, state: value),
                    NewsPage(onOpenMenu: toggleMenu, state: value),
                  ],
                  index: index,
                ),
                // body: screens[index],
                // body: Container(
                //   child: [
                //     StatsPage(onOpenMenu: toggleMenu, state: value),
                //     ReportsPage(onOpenMenu: toggleMenu, state: value),
                //     LandingPage(onOpenMenu: toggleMenu, state: value),
                //     CountersPage(onOpenMenu: toggleMenu, state: value),
                //     NewsPage(onOpenMenu: toggleMenu, state: value),
                //   ][index],
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, Johnson",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
              size: 20.0,
              color: Colors.white,
            ),
            title: const Text("My Account"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.favorite,
              size: 20.0,
              color: Colors.white,
            ),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.notifications,
                size: 20.0, color: Colors.white),
            title: const Text("Notifications"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.call, size: 20.0, color: Colors.white),
            title: const Text("Contact"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.info, size: 20.0, color: Colors.white),
            title: const Text("About"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            leading:
                const Icon(Icons.exit_to_app, size: 20.0, color: Colors.white),
            title: const Text("Exit"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
