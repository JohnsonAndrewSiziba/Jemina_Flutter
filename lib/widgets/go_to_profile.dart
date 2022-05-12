// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../data/constants/theme_colors.dart';

class GotoProfile extends StatelessWidget {
  double size;
  GotoProfile({
    Key? key, this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 9.0, bottom: 6.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: grayBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4,
              spreadRadius: 3,
            )
          ],
          border: Border.all(
            width: 0.6,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        // padding: EdgeInsets.all(1),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/account');
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            ),
          ),
        ),
      ),
    );
  }
}
