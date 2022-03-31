// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:jemina_capital/views/home/news/components/news_item.dart';
// 1,

Widget listWidget(News item) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 2.0, horizontal: kDefaultPadding - 13.0),
    child: Card(
      elevation: 0.5,
      shadowColor: techBlue,
      // margin: EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        // color: techBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/newspaper.png",
                        width: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        item.publication,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Image.asset(
                        "assets/images/schedule.png",
                        width: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        item.date.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
