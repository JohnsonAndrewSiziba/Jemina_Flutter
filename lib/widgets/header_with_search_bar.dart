// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../data/constants/theme_colors.dart';
import 'go_to_profile.dart';

class HeaderWithSearchBar extends StatelessWidget {
  String placeholder;
  HeaderWithSearchBar({
    Key? key,
    required this.size,
    required this.placeholder,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding - 10.0),
      height: size.height * 0.2 - 98.0,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 124.0,
            decoration: BoxDecoration(
              color: brightGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.0),
                bottomRight: Radius.circular(11.0),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 10.0,
                    color: brightGrey,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: placeholder,
                  focusColor: darkGreyBlue,
                  hintStyle: TextStyle(
                    color: darkGreyBlue.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
