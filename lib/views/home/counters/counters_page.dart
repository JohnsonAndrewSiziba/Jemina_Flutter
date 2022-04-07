// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/counters/counters_controller.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jemina_capital/data/constants/values.dart';
import 'package:jemina_capital/models/company.dart';
import 'package:jemina_capital/views/home/counters/views/view_counter/view_counter.dart';
import 'package:jemina_capital/widgets/go_to_profile.dart';
import 'package:skeletons/skeletons.dart';

import '../../../data/constants/api_routes.dart';
import '../../../library/request_response.dart';

class CountersPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;

  CountersPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<CountersPage> createState() => _CountersPageState();
}

class _CountersPageState extends State<CountersPage> {

  @override
  bool get wantKeepAlive => true;

  List<String> categories = [
    "ZSE Equity Counters",
    "VFEX Equity Counters",
    "ZSE ETF Counters",
  ];

  int selectedIndex = 0;
  bool isLoading = true;

  late RequestResponse requestResponse;
  List<Company> companiesList = [];

  @override
  void initState() {
    super.initState();
    getCompanies();
  }

  void getCompanies() async {
    CountersController countersController = CountersController();
    requestResponse = await countersController.getZSECounters();
    var jsonBody = requestResponse.getJsonBody();

    var jsonCompaniesList = jsonBody['companies'];

    setState(() {
      companiesList = Company.jsonDecode(jsonCompaniesList);
      // print("The Counters: " + companiesList.toString());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: brightGrey,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderWithSearchBar(placeholder: "Search counter...", size: size),
          Container(
            color: brightGrey,
            child: Padding(
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
          ),
          Expanded(
            child: Skeleton(
              isLoading: isLoading,
              skeleton: SkeletonListView(),
              child: Container(
                color: lightSteel,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding - 10.0, vertical: 10.0,
                  ),
                  child: ListView.builder(
                      itemCount: companiesList.length,
                      itemBuilder: (context, index) {
                        return company(
                          context: context,
                          company: companiesList[index],
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
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
                    ? darkGreyBlue
                    : darkGreyBlue.withOpacity(0.8),
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
      backgroundColor: brightGrey,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          widget.onOpenMenu();
          setState(() {
            widget.state == 0 ? widget.state = 1 : widget.state = 0;
          });
        },
        icon: SvgPicture.asset("assets/icons/menu.svg", color: darkGreyBlue,),
      ),
      title: Text("Listed Securities", style: TextStyle(color: darkGreyBlue,),),
      actions: [
        GotoProfile(),
      ],
    );
  }
}

Widget company({required BuildContext context, required Company company}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewCounter(),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              Routes.serverHome + (company.logoPath ?? ""),
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        company.name ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: darkGreyBlue),
                      ),

                      Text(
                        '( ${company.symbol?.toUpperCase() ?? ""} )',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0, color: Colors.blueGrey,),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            company.sector ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            ",",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            company.listing ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        company.percentageChange >= 0 ? '+ ${company.percentageChange} %' : '${company.percentageChange} %',
                        style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12.0,
                          color: getColor(company.percentageChange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          (company.marketCap! + " (M)"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                            fontSize: 15.0,
                        ),
                      ),
                      // SizedBox(width: 10.0),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              company.price ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0,
                                color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            "ZWL",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
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

getColor(value) {
  if (value < 0){
    return Colors.red;
  }
  else if (value > 0) {
    return Colors.green;
  }

  else {
    return Colors.blueGrey;
  }
}

Widget card(
    {double width = double.infinity,
    double padding = 20,
    required Widget child}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(defaultBorderRadius),
      ),
    ),
    child: child,
  );
}
