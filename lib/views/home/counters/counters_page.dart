// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/counters/counters_controller.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jemina_capital/data/constants/values.dart';
import 'package:jemina_capital/models/company.dart';
import 'package:jemina_capital/views/home/counters/views/view_counter/view_counter.dart';
import 'package:jemina_capital/widgets/go_to_profile.dart';

import '../../../data/constants/api_routes.dart';
import '../../../library/request_response.dart';
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
      print("The Counters: " + companiesList.toString());
    });
  }

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
          borderRadius: BorderRadius.circular(defaultBorderRadius),
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

Widget company(
    {

    required BuildContext context, required Company company}) {
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

                  RichText(
                    text: TextSpan(
                      text: company.name ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      children: const <TextSpan>[
                        TextSpan(text: 'SYMB.ZW'),
                      ],
                    ),
                  ),

                  Text(
                    '00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '01',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  // precent >= 0 ? '+ $precent %' : '$precent %',
                  '02',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: precent >= 0 ? Colors.green : Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
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
