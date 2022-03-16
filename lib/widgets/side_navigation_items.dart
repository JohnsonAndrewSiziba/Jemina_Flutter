// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../data/constants/theme_colors.dart';

class SideNavigationItems extends StatelessWidget {
  const SideNavigationItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Your Name",
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
                  Icons.call_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
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
    );
  }
}
