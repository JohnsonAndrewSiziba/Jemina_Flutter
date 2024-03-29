// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jemina_capital/views/home/landing/components/top_marquee.dart';
import 'package:jemina_capital/views/orders/orders.dart';
import 'package:jemina_capital/views/portfolio/portfolio.dart';
import 'package:jemina_capital/views/profile/profile.dart';
import 'package:jemina_capital/views/settings/settings_page.dart';
import 'package:jemina_capital/views/trading/trading_home.dart';
import 'package:jemina_capital/views/wallet/wallet.dart';

import '../../../controllers/misc_controller/MiscController.dart';
import '../../../controllers/statistics/price_sheets_controller.dart';
import '../../../data/constants/theme_colors.dart';
import '../../../library/request_response.dart';
import '../../../models/quote.dart';
import '../../../models/top_marquee_price.dart';
import '../shared/build_main_page_app_bar.dart';
import 'components/quote.dart';

class LandingPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  Function toggleTab;
  double state;
  LandingPage(
      {Key? key,
      required this.onOpenMenu,
      required this.state,
      required this.toggleTab})
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
      backgroundColor: kPrimaryColorLight1,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Jemina Capital"),
      body: Column(
        children: [
          TopMarquee(),
          Expanded(
            child: RefreshIndicator(
              color: darkGreyBlue,
              backgroundColor: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Balances(),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      color: kPrimaryColorLight1,
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: .95,
                        crossAxisSpacing: 10,
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        children: <Widget>[
                          MenuCard(
                            title: "Markets",
                            image: "assets/svg/finance_app.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TradingHome()),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Orders",
                            image: "assets/svg/orders.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Orders()),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Wallet",
                            image: "assets/svg/wallet.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wallet(),
                                ),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Portfolio",
                            image: "assets/svg/report_analysis.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Portfolio(),
                                ),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Profile",
                            image: "assets/svg/personal_data.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                              );
                            },
                          ),
                          MenuCard(
                            title: "Settings",
                            image: "assets/svg/settings.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      color: kPrimaryColorLight1,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Text(
                              "TOOLS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'avenir',
                                color: darkGreyBlue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          GridView.count(
                            crossAxisCount: 4,
                            childAspectRatio: 0.7,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              serviceWidget("assets/images/calculator.png",
                                  "Investment\nCalculator"),
                              serviceWidget("assets/images/calendar.png",
                                  "Investor\nDiary"),
                              serviceWidget("assets/images/book.png",
                                  "Investment\nHandbook"),
                              serviceWidget(
                                  "assets/images/question.png", "FAQ\nCenter"),
                              // serviceWidget("assets/images/calculator.png", "Cashback\nOffer"),
                              // serviceWidget("assets/images/calculator.png", "Movie\nTicket"),
                              // serviceWidget("more", "More\n"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    QuotesContainer(
                      size: size,
                      quote: quote,
                      quoteIsLoading: quoteIsLoading,
                    ),

                    SizedBox(height: 70.0),

                    // TOOLS
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceWidget(String img, String name) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              print("$img");
            },
            child: Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                // color: Color(0xfff1f3f6),
                color: kPrimaryColorLight1,
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColorLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Balances extends StatelessWidget {
  const Balances({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.trending_up, color: Colors.blueGrey, size: 20.0),
                    SizedBox(width: 5.0),
                    Text(
                      "Portfolio Value",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    "100 200,600.00",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.notoSansIndicSiyaqNumbers(
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        color: darkGreyBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ]),
                SizedBox(width: 5.0),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.green, size: 15.0),
                    SizedBox(width: 5.0),
                    Text(
                      "(6.20%)",
                      style: GoogleFonts.notoSansIndicSiyaqNumbers(
                        textStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.credit_card, color: Colors.blueGrey, size: 20.0),
                    SizedBox(width: 5.0),
                    Text(
                      "Wallet Balance",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  "200 020 600.00",
                  style: GoogleFonts.notoSansIndicSiyaqNumbers(
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      color: darkGreyBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuotesContainer extends StatelessWidget {
  const QuotesContainer({
    Key? key,
    required this.size,
    required this.quote,
    required this.quoteIsLoading,
  }) : super(key: key);

  final Size size;
  final Quote quote;
  final bool quoteIsLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * .15,
          decoration: BoxDecoration(
            color: kPrimaryColorLight,
            image: DecorationImage(
              image: AssetImage("assets/images/forex-trading.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          height: size.height * .15,
          decoration: BoxDecoration(
            color: kPrimaryColorLight.withOpacity(0.89),
          ),
        ),
        QuoteComponent(size: size, quote: quote, isLoading: quoteIsLoading),
      ],
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
    return Material(
      elevation: 0.3,
      color: Colors.white,
      shadowColor: kPrimaryColorLight1,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              // Image.asset(image),
              SvgPicture.asset(image, height: 100),
              Spacer(),
              Text(
                title.toUpperCase(),
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
    );
  }
}
