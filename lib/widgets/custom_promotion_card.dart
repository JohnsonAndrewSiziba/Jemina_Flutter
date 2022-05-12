// ignore_for_file: prefer_const_constructors

import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../data/promotion.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/padding.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: appPadding, right: appPadding),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: size.width * .425,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: blueColor3,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Promotion['title'].toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: textWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: size.width * .425,
                  child: Text(
                    Promotion['subTitle'].toString(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: textWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 35.0,
                  width: 100.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kStockColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: kStockColor.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: textWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 1.0,
            child: Container(
              height: size.width * .4,
              child: Image.asset(
                Promotion['image'].toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
