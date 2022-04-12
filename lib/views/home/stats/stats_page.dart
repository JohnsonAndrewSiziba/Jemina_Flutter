// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/controllers/statistics/price_sheets_controller.dart';
import 'package:skeletons/skeletons.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../library/request_response.dart';
import '../../../models/price.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';
import '../shared/category_menu.dart';
import 'components/prices_list_widget.dart';

class StatsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  StatsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  static Color primaryColor = techBlue;
  static Color secondaryColor = complement;

  late RequestResponse requestResponse;
  List<Price> pricesList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPriceSheet();
  }

  void getPriceSheet() async {
    PriceSheetsController priceSheetsController = PriceSheetsController();
    requestResponse = await priceSheetsController.getPriceSheet();
    var jsonBody = requestResponse.getJsonBody();

    var jsonPricesList = jsonBody['prices'];

    setState(() {
      pricesList = Price.jsonDecode(jsonPricesList);
      isLoading = false;
    });
  }

  void onOpenMenu() {
    widget.onOpenMenu();
  }

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
    return Scaffold(
      backgroundColor: brightGrey,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Market Statistics"),
      body: Column(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Skeleton(
                isLoading: isLoading,
                skeleton: SkeletonListView(),
                child: RefreshIndicator(
                  color: darkGreyBlue,
                  backgroundColor: brightGrey,
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1));
                  },
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pricesList.length,
                      itemBuilder: (context, index) {
                        return pricesListWidget(context: context, price: pricesList[index]);
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
