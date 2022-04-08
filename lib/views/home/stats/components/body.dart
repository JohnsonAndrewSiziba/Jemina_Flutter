// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/stats/components/stats_main_body.dart';

import '../../../../data/constants/theme_colors.dart';
import '../../shared/category_menu.dart';

class StatsBody extends StatefulWidget {
  StatsBody({Key? key}) : super(key: key);

  @override
  State<StatsBody> createState() => _StatsBodyState();
}

class _StatsBodyState extends State<StatsBody> {
  List<String> categories = [
    "Price Sheets",
    "Market Statistics",
  ];

  List<IconData> icons = [
    Icons.candlestick_chart,
    Icons.insert_chart,
  ];

  void categortMenuTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: jeminaGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11.0),
              bottomRight: Radius.circular(11.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 12,
                color: scaffoldBackgroundColor,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding - 10.0, horizontal: 10.0),
            child: SizedBox(
              height: 34.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategoryItem(index, categortMenuTap, selectedIndex, icons, categories),
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

  // Widget buildCategory(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedIndex = index;
  //       });
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text(
  //             categories[index],
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: selectedIndex == index
  //                   ? darkGreyBlue
  //                   : darkGreyBlue.withOpacity(0.7),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
  //             height: 2,
  //             width: 30,
  //             color: selectedIndex == index ? complement : Colors.transparent,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
