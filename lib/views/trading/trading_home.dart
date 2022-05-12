// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/widgets/card.dart';
import 'package:skeletons/skeletons.dart';
import '../../controllers/trading/counters_list_controller.dart';
import '../../data/constants/api_routes.dart';
import '../../library/request_response.dart';
import '../../models/trading_counter_list_item.dart';
import '../../widgets/go_to_profile.dart';
import '../home/shared/category_menu.dart';
import 'components/search_form.dart';

class TradingHome extends StatefulWidget {
  const TradingHome({Key? key}) : super(key: key);

  @override
  State<TradingHome> createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {

  int selectedIndex = 0;
  bool isLoading = true;

  List<String> categories = [
    "ZSE Equities",
    "ZSE ETFs",
  ];

  List<IconData> icons = [
    Icons.business_sharp,
    Icons.business_sharp,
    Icons.business_sharp,
  ];

  void categortMenuTap(int index){
    setState(() {
      selectedIndex = index;

      if (index == 0) {
        selectedCountersList = zseCountersList;
      }
      else if (index == 1) {
        selectedCountersList = zseEtfCountersList;
      }

    });
  }

  late RequestResponse requestResponse;
  List<TradingCounterListItem> zseCountersList = [];
  List<TradingCounterListItem> zseEtfCountersList = [];

  List<TradingCounterListItem> selectedCountersList = [];

  @override
  void initState() {
    super.initState();
    getZseCounters();
  }

  void getZseCounters() async {
    CountersListController countersController = CountersListController();

    requestResponse = await countersController.getZSECounters();
    var jsonBody = requestResponse.getJsonBody();

    var jsonZseCountersList = jsonBody['counters'];


    requestResponse = await countersController.getZseEtfCounters();
    jsonBody = requestResponse.getJsonBody();

    var jsonZseEtfCountersList = jsonBody['counters'];


    setState(() {
      zseCountersList = TradingCounterListItem.jsonDecode(jsonZseCountersList);
      zseEtfCountersList = TradingCounterListItem.jsonDecode(jsonZseEtfCountersList);

      if (selectedIndex == 0) {
        selectedCountersList = zseCountersList;
      }
      else if (selectedIndex == 1) {
        selectedCountersList = zseEtfCountersList;
      }

      isLoading = false;
    });
  }

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
              // Text(
              //   "Market Status: Open",
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.lato(
              //     fontSize: 14.0,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.green,
              //   ),
              // ),
              // SizedBox(height: 10.0),

              Container(
                color: kPrimaryColorLight1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding - 10.0,
                    horizontal: 10.0,
                  ),
                  child: SizedBox(
                    height: 34,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => buildCategoryItem(index, categortMenuTap, selectedIndex, icons, categories),
                    ),
                  ),
                ),
              ),

              SearchForm(),
              SizedBox(height: 8.0),
              Expanded(
                child: Skeleton(
                  isLoading: isLoading,
                  skeleton: SkeletonListView(),
                  child: RefreshIndicator(
                    color: darkGreyBlue,
                    backgroundColor: brightGrey,
                    onRefresh: () {
                      setState(() {
                        isLoading = true;
                      });
                      getZseCounters();
                      return Future.delayed(Duration(seconds: 1));
                    },
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        itemCount: selectedCountersList.length,
                        itemBuilder: (context, index) {
                          return MarketListItem(
                            counter: selectedCountersList[index],
                          );
                        }),
                  ),
                ),
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
      actions: [
        GotoProfile(),
      ],
    );
  }
}

class MarketListItem extends StatelessWidget {
  TradingCounterListItem counter;
  MarketListItem({
    Key? key, required this.counter,
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
                          counter.name ?? "",
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
                              Routes.serverHome + (counter.logoPath ?? ""),
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
