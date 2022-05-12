// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/card.dart';

Widget newsListWidget({required BuildContext context, required News news}) {
  return GestureDetector(
    onTap: () {
      _launchURL(news.url);
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  news.imagePath,
                  width: 60.0,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: darkGreyBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/newspaper.png",
                            width: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            news.publication,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            "assets/images/schedule.png",
                            width: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            news.date.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// _launchURL(newsList[index].url);

void _launchURL(String url) async {
  if (!await launch(url)) {
    throw 'Could not launch $url';
  }
}