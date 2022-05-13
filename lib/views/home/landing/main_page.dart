// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../../controllers/misc_controller/MiscController.dart';
import '../../../controllers/statistics/price_sheets_controller.dart';
import '../../../data/category_json.dart';
import '../../../data/courses_json.dart';
import '../../../data/user_profile.dart';
import '../../../library/request_response.dart';
import '../../../models/quote.dart';
import '../../../models/top_marquee_price.dart';
import '../../../theme/colors.dart';
import '../../../theme/padding.dart';
import '../../../widgets/bottom_clipper.dart';
import '../../../widgets/custom_category_card.dart';
import '../../../widgets/custom_course_card_expand.dart';
import '../../../widgets/custom_heading.dart';
import '../../../widgets/custom_promotion_card.dart';
import '../../../widgets/custom_search_field.dart';
import '../../../widgets/custom_title.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';
import 'components/top_marquee.dart';
import 'landing_page.dart';

class MainPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  Function toggleTab;
  double state;
  MainPage(
      {Key? key,
      required this.onOpenMenu,
      required this.state,
      required this.toggleTab})
      : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      // extendBodyBehindAppBar: true,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Jemina Capital",
          showProfile: false),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
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
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                    width: size.width,
                    height: 380.0,
                    decoration: BoxDecoration(
                      color: kPrimaryColorLight1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      TopMarquee(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: appPadding - 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomHeading(
                              title: "Hi, Johnson",
                              subTitle:
                                  "Walet Balance: ZWL\$ 20, 000.05 \nMarket Status: Open",
                              color: kStockColor,
                            ),
                            GotoProfile(
                              size: 50.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacer - 30),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: appPadding),
                        child: CustomSearchField(
                          hintField: "Try Company Name",
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: spacer - 30,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: appPadding),
                        child: CustomCategoryCard(
                          menu: menuRow1,
                        ),
                      ),
                      SizedBox(
                        height: spacer - 30,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: appPadding),
                        child: CustomCategoryCard(
                          menu: menuRow2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: spacer - 20),
            PortfolioCard(),
            SizedBox(height: spacer - 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: kPrimaryColorLight,
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
                      serviceWidget(
                          "assets/images/calendar.png", "Investor\nDiary"),
                      serviceWidget(
                          "assets/images/book.png", "Investment\nHandbook"),
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
            SizedBox(height: spacer),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: CustomTitle(title: "Featured Reports"),
            ),
            SizedBox(height: smallSpacer - 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: appPadding - 10,
                  left: appPadding,
                  bottom: 30,
                ),
                child: Wrap(
                  spacing: 10.0,
                  children: List.generate(CoursesJson.length, (index) {
                    return FeaturedReportCard(
                      thumbNail: CoursesJson[index]['image'],
                      date: CoursesJson[index]['video'],
                      title: CoursesJson[index]['title'],
                      userProfile: CoursesJson[index]['user_profile'],
                      userName: CoursesJson[index]['user_name'],
                      views: CoursesJson[index]['price'],
                    );
                  }),
                ),
              ),
            ),
            QuotesContainer(
              size: size,
              quote: quote,
              quoteIsLoading: quoteIsLoading,
            ),
            SizedBox(height: 80),
          ],
        ),
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
