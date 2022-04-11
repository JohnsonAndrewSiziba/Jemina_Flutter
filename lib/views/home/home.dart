// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/contact/contact.dart';
import 'package:jemina_capital/views/help/help_page.dart';
import 'package:jemina_capital/views/home/account/account_page.dart';
import 'package:jemina_capital/views/home/counters/counters_page.dart';
import 'package:jemina_capital/views/home/landing/landing_page.dart';
import 'package:jemina_capital/views/home/news/news_page.dart';
import 'package:jemina_capital/views/home/reports/reports_page.dart';
import 'package:jemina_capital/views/notifications/notifications_page.dart';
import 'package:jemina_capital/views/settings/settings_page.dart';
import 'package:jemina_capital/views/home/stats/stats_page.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import '../about/about_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;
  double value = 0;

  int _currentIndex = 0;

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
      closeIcon: Icon(Icons.close, color: darkGreyBlue,),
      background: brightGrey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: Container(
        color: brightGrey,
        child: SafeArea(
          top: false,
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: FloatingNavbar(
              onTap: (int val) => setState(() => index = val),
              currentIndex: index,
              selectedItemColor: Colors.white,
              selectedBackgroundColor: darkGreyBlue,
              backgroundColor: brightGrey,
              unselectedItemColor: Colors.blueGrey,
              iconSize: 20.0,
              items: [
                FloatingNavbarItem(icon: Icons.pie_chart, title: 'Stats.'),
                FloatingNavbarItem(icon: Icons.history_edu, title: 'Reports'),
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(icon: Icons.business_center, title: 'Counters'),
                FloatingNavbarItem(icon: Icons.chrome_reader_mode, title: 'News'),
              ],
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
              children: [
                GestureDetector(
                  onTap: () {
                    toggleMenu();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountPage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, Johnson",
                  style: TextStyle(color: darkGreyBlue),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              setState(() {
                index = 2;
              });
            },
            leading: Icon(Icons.home, size: 20.0, color: darkGreyBlue),
            title: Text("Home", style: TextStyle(color: darkGreyBlue),),
            textColor: darkGreyBlue,
            dense: true,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
            leading: Icon(
              Icons.person,
              size: 20.0,
              color: darkGreyBlue,
            ),
            title: Text("My Account", style: TextStyle(color: darkGreyBlue),),
            textColor: darkGreyBlue,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              );
            },
            leading: Icon(
              Icons.help,
              size: 20.0,
              color: darkGreyBlue,
            ),
            title: const Text("Help"),
            textColor: darkGreyBlue,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            leading: Icon(Icons.notifications,
                size: 20.0, color: darkGreyBlue,),
            title: Text("Notifications"),
            textColor: darkGreyBlue,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
            leading: Icon(Icons.call, size: 20.0, color: darkGreyBlue,),
            title: const Text("Contact"),
            textColor: darkGreyBlue,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            leading:
                 Icon(Icons.settings, size: 20.0, color: darkGreyBlue,),
            title: const Text("Settings"),
            textColor: darkGreyBlue,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            leading: Icon(Icons.info, size: 20.0, color: darkGreyBlue,),
            title: const Text("About"),
            textColor: darkGreyBlue,
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
            Icon(Icons.exit_to_app, size: 20.0, color: darkGreyBlue,),
            title: const Text("Exit"),
            textColor: darkGreyBlue,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
