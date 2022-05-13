// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/widgets/custom_heading.dart';
import 'package:jemina_capital/widgets/custom_holdings_card.dart';
import 'package:jemina_capital/widgets/custom_search_field.dart';
import 'package:jemina_capital/widgets/custom_title.dart';
import '../../theme/colors.dart';
import '../../theme/padding.dart';
import '../../widgets/go_to_profile.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      appBar: buildAppBar(context, () {}, 'Portfolio'),
      body: SafeArea(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: CustomTitle(
                  title: 'Portfolio Value',
                  color: secondary,
                  extend: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 10.0),
                child: Column(
                  children: [
                    PortfolioSummary(
                      title: "Holdings",
                      value: "10",
                    ),
                    Divider(),
                    PortfolioSummary(
                      title: "Portfolio Value",
                      value: "\$10,000,000",
                    ),
                    Divider(),
                    PortfolioSummary(
                      title: "Day Gain/Loss",
                      value: "\$1,000",
                    ),
                    Divider(),
                    PortfolioSummary(
                        title: "% Day Gain/Loss", value: "\$1,000"),
                  ],
                ),
              ),
              SizedBox(height: spacer - 30),

              //search
              CustomSearchField(
                hintField: 'Try Counter Name',
                backgroundColor: Colors.white,
              ),
              SizedBox(height: spacer - 25),

              //title
              CustomTitle(title: 'All Holdings', extend: false),
              SizedBox(height: smallSpacer - 13),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
                left: appPadding - 11, right: appPadding - 11, bottom: 0),
            width: MediaQuery.of(context).size.width,
            color: kPrimaryColorLight1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomHoldingsCard(
                      image:
                          "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                      title: "Afdis",
                      instructor: "one",
                      videoAmount: "Two",
                      percentage: 33,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context, Function onTap, String pageTitle) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColorLight,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      title: Text(
        pageTitle,
        style: TextStyle(color: darkGreyBlue),
      ),
      actions: [
        GotoProfile(),
      ],
    );
  }
}

class PortfolioSummary extends StatelessWidget {
  String title;
  String value;
  bool isChange;
  num absoluteChange;
  num percentageVhange;

  PortfolioSummary({
    Key? key,
    required this.title,
    required this.value,
    this.isChange = false,
    this.absoluteChange = 0,
    this.percentageVhange = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.5,
            color: darkGreyBlue,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: blueColor3,
          ),
        ),
        // SizedBox(width: 50.0),
      ],
    );
  }
}
