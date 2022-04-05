// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/controllers/reports/reports_controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/constants/values.dart';
import 'package:jemina_capital/library/request_response.dart';
import 'package:jemina_capital/models/report.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/view_report.dart';

import '../../../widgets/card.dart';
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
  late RequestResponse requestResponse;
  List<Report> reportsList = [];

  @override
  void initState() {
    super.initState();
    getAllReports();
  }

  void getAllReports() async {
    ReportsController reportsController = ReportsController();
    requestResponse = await reportsController.getAllReports();
    var jsonBody = requestResponse.getJsonBody();

    var jsonReportsList = jsonBody['reports'];

    setState(() {
      reportsList = Report.jsonDecode(jsonReportsList);
    });
  }

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
      backgroundColor: scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: techBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(defaultBorderRadius),
                bottomRight: Radius.circular(defaultBorderRadius),
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
              ),
              child: ListView.builder(
                  itemCount: reportsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: reportListWidget(context: context, report: reportsList[index]),
                    );
                  }),
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

Widget reportListWidget({required BuildContext context, required Report report}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewReport(report: report),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  Routes.serverHome + report.reportImagePath,
                  width: 70,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                    report.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0,),
                      ),
                      Text(
                        report.extract ?? "",
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Date: " + report.toDate.toString(), style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                Spacer(),
                Text(report.reportType ?? "", style: TextStyle(fontSize: 12.0, color: Colors.grey),),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}