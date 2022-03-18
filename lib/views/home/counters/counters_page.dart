// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jemina_capital/views/home/counters/views/view_counter.dart';
import 'package:jemina_capital/widgets/go_to_profile.dart';

import '../../../widgets/header_with_search_bar.dart';

class CountersPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;

  CountersPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<CountersPage> createState() => _CountersPageState();
}

class _CountersPageState extends State<CountersPage> {
  List<String> categories = [
    "ZSE Equity Counters",
    "VFEX Equity Counters",
    "ZSE ETF Counters",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithSearchBar(placeholder: "Search counter...", size: size),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding - 10.0,
              ),
              child: SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding - 10.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.timeline,
                          "African Sun",
                          120,
                          20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewCounter(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 85,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: grayBackground,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "\$$amount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "($percentage shares)",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    // color: Colors.grey.shade300,
                  ),
                ),
                Container(
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    // color: Color(0XFF00B686),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
                    ? Colors.black.withOpacity(0.8)
                    : Colors.blueGrey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kDefaultPadding / 4 - 5.0), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? complement : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: techBlue,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          widget.onOpenMenu();
          setState(() {
            widget.state == 0 ? widget.state = 1 : widget.state = 0;
          });
        },
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      title: Text("Listed Securities"),
      actions: [
        GotoProfile(),
      ],
    );
  }
}
