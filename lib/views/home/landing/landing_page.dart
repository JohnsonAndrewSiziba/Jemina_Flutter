// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/views/home/landing/components/top_marquee.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../library/request_response.dart';
import '../../../models/quote.dart';
import '../../../models/top_marquee_price.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';
import 'components/quote.dart';

class LandingPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  LandingPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double value = 0;

  void onOpenMenu() {
    widget.onOpenMenu();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Jemina Capital"),
      body: Column(
        children: [
          TopMarquee(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        height: size.height * .15,
                        decoration: BoxDecoration(
                          color: brightGrey,
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/forex-trading.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * .15,
                        decoration: BoxDecoration(
                          color: lightSteel.withOpacity(0.93),
                        ),
                      ),
                      QuoteComponent(size: size),
                    ],
                  ),
                  Container(
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    color: lightSteel,
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        MenuCard(
                          title: "Trading",
                          image: "assets/images/finance_app_one.png",
                          press: () {},
                        ),
                        MenuCard(
                          title: "Account",
                          image: "assets/images/profile.png",
                          press: () {},
                        ),
                        MenuCard(
                          title: "Market Data",
                          image: "assets/images/data.png",
                          press: () {},
                        ),
                        MenuCard(
                          title: "Reports",
                          image: "assets/images/report.png",
                          press: () {},
                        ),
                        MenuCard(
                          title: "Counters",
                          image: "assets/images/startup.png",
                          press: () {},
                        ),
                        MenuCard(
                          title: "News",
                          image: "assets/images/news.png",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String image;
  final String title;
  final Function press;
  const MenuCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: grayBackground,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(image),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: darkGreyBlue,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
