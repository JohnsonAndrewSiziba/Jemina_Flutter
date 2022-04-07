import 'package:flutter/material.dart';

import '../data/constants/theme_colors.dart';
import '../data/data.dart';
import '../views/notifications/notifications_page.dart';

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        boxShadow: customShadow,
        color: lightSteel,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsPage(),
            ),
          );
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: customShadow,
                  color: Colors.blueGrey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  boxShadow: customShadow,
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.notifications,
                color: darkGreyBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
