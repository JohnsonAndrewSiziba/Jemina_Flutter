// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/stats/components/stats_main_body.dart';

class StatsBody extends StatefulWidget {
  StatsBody({Key? key}) : super(key: key);

  @override
  State<StatsBody> createState() => _StatsBodyState();
}

class _StatsBodyState extends State<StatsBody> {
  List<String> categories = [
    "Price Sheets",
    "Market Stats.",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: techBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11.0),
              bottomRight: Radius.circular(11.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 24,
                color: Colors.white,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding - 10.0),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: MainBody(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? complement : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
