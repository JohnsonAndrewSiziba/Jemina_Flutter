// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/widgets/card.dart';
import '../../widgets/go_to_profile.dart';
import 'components/search_form.dart';

class TradingHome extends StatefulWidget {
  const TradingHome({Key? key}) : super(key: key);

  @override
  State<TradingHome> createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      appBar: buildTradingPageAppBar(context, () {}, 'Markets'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Market Status: Open",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10.0),
              SearchForm(),

              SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                    MarketListItem(),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildTradingPageAppBar(
      BuildContext context, Function onTap, String pageTitle) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColorLight1,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      title: Text(
        pageTitle,
        style: TextStyle(color: darkGreyBlue),
      ),
      actions: const [
        GotoProfile(),
      ],
    );
  }
}

class MarketListItem extends StatelessWidget {
  const MarketListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "African Distillers Limited",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: darkGreyBlue,
                            fontFamily:
                                GoogleFonts.robotoCondensed().fontFamily,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "22.07",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: darkGreyBlue,
                                  fontFamily:
                                      GoogleFonts.robotoCondensed().fontFamily,
                                ),
                              ),
                              Icon(Icons.arrow_upward,
                                  color: Colors.green, size: 15.0),
                              Text(
                                "(10.00%)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                  fontSize: 12.0,
                                  fontFamily: GoogleFonts.oswald().fontFamily,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://www.thecreativecollective.com.au/wp-content/uploads/2022/01/Z99_lSr5iJDhKwYuuM-SdGh6g6iDm8v5fgg9DQ-1024x724.png',
                              width: 37,
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              '( AFDS.ZW )',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.0,
                                fontFamily: GoogleFonts.oswald().fontFamily,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        BidAndAsk(
                          title: 'Best Ask',
                          value: '1,000.00',
                          color: askColor,
                        ),
                        BidAndAsk(
                          title: 'Ask Vol.',
                          value: '1,000.00',
                          color: askColor,
                        ),
                        BidAndAsk(
                          title: 'Best Bid',
                          value: '1,000.00',
                          color: bidColor,
                        ),
                        BidAndAsk(
                          title: 'Bid Vol.',
                          value: '1,000.00',
                          color: bidColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BidAndAsk extends StatelessWidget {
  Color color;
  String title;
  String value;

  BidAndAsk({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: color,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: color,
              fontFamily: GoogleFonts.robotoCondensed().fontFamily,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}

class WalletBalance extends StatelessWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
