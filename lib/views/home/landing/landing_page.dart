// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/views/home/account/account_page.dart';
import 'package:jemina_capital/views/home/landing/components/top_marquee.dart';
import 'package:jemina_capital/views/trading/trading_home.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../controllers/misc_controller/MiscController.dart';
import '../../../controllers/statistics/price_sheets_controller.dart';
import '../../../data/constants/theme_colors.dart';
import '../../../library/request_response.dart';
import '../../../models/quote.dart';
import '../../../models/top_marquee_price.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';
import 'components/quote.dart';

class LandingPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  Function toggleTab;
  double state;
  LandingPage({Key? key, required this.onOpenMenu, required this.state, required this.toggleTab})
      : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double value = 0;

  Quote quote = Quote(text: "", author: "");
  bool quoteIsLoading = true;

  late RequestResponse requestResponse;
  List<TopMarqueePrice> pricesList = [];

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  void getQuote() async {
    MiscellaneousController miscellaneousController = MiscellaneousController();
    requestResponse = await miscellaneousController.getQuote();
    var jsonBody = requestResponse.getJsonBody();

    setState(() {
      quote = Quote(text: jsonBody['text'], author: jsonBody['author']);
      quoteIsLoading = false;
    });
  }

  void getMarqueeValues() async {
    PriceSheetsController priceSheetsController = PriceSheetsController();
    requestResponse = await priceSheetsController.getTopMarqueePrices();
    var jsonBody = requestResponse.getJsonBody();

    var jsonNewsList = jsonBody['prices'];

    setState(() {
      pricesList = TopMarqueePrice.jsonDecode(jsonNewsList);
      quoteIsLoading = false;
      // print(jsonBody.toString());
    });
  }


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
            child: RefreshIndicator(
              color: darkGreyBlue,
              backgroundColor: brightGrey,
              onRefresh: () {
                setState(() {
                  quoteIsLoading = true;
                });
                getQuote();
                return Future.delayed(Duration(seconds: 0));
              },
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
                            color: lightSteel.withOpacity(0.89),
                          ),
                        ),
                        QuoteComponent(size: size, quote: quote, isLoading: quoteIsLoading),
                      ],
                    ),
                    Container(
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
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
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TradingHome()),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Account",
                            image: "assets/images/profile.png",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccountPage()),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Market Data",
                            image: "assets/images/data.png",
                            press: () {
                              widget.toggleTab(0);
                            },
                          ),
                          MenuCard(
                            title: "Reports",
                            image: "assets/images/report.png",
                            press: () {
                              widget.toggleTab(1);
                            },
                          ),
                          MenuCard(
                            title: "Counters",
                            image: "assets/images/startup.png",
                            press: () {
                              widget.toggleTab(3);
                            },
                          ),
                          MenuCard(
                            title: "News",
                            image: "assets/images/news.png",
                            press: () {
                              widget.toggleTab(4);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
  final VoidCallback press;
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
          borderRadius: BorderRadius.circular(8.0),
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
          elevation: 1.0,
          color: Colors.white,
          child: InkWell(
            onTap: press,
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
