// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/reports/views/view_report.dart';

import '../../../widgets/go_to_profile.dart';

class ReportsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;

  ReportsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<String> categories = [
    "Daily Updates",
    "Weekly Updates",
    "Monthly Updates",
    "Economic Reviews"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      // backgroundColor: techBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: techBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.0),
                bottomRight: Radius.circular(11.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Colors.white,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding - 10.0),
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                      ReportCard(
                        text:
                            "Lalala aaa lalala lalala lala lalaaaaaaaa lalalalala lalalalala lala lalalalalalala lalaaaaaaa.",
                        image: "assets/images/finance_app.png",
                        title: "The report title",
                      ),
                    ],
                  ),
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
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
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
      title: Text("Reports"),
      actions: [
        GotoProfile(),
      ],
    );
  }
}

class ReportCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const ReportCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewReport(),
            ),
          );
        },
        child: SizedBox(
          height: 156,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: grayBackground,
                    ),
                  ],
                ),
              ),
              Image.asset(image),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        // style: kTitleTextstyle.copyWith(
                        //   fontSize: 16,
                        // ),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
