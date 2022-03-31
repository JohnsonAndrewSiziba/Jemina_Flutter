// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/controllers/reports/reports_controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/library/request_response.dart';
import 'package:jemina_capital/models/report.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/view_report.dart';

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
              child: ListView.builder(
                  itemCount: reportsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ReportCard(report: reportsList[index]),
                      // child: ReportCard(
                      //   text: reportsList[index].extract ?? "",
                      //   image: Routes.serverHome +
                      //       reportsList[index].reportImagePath, //
                      //   title: reportsList[index].title,
                      // ),
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

class ReportCard extends StatelessWidget {
  final Report report;
  const ReportCard({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewReport(report: report),
            ),
          );
        },
        child: SizedBox(
          height: 146,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    Routes.serverHome + report.reportImagePath,
                    fit: BoxFit.fill,
                    height: 80.0,
                    width: 120.0,
                  ),
                ),
              ),
              Positioned(
                top: 116,
                left: 6,
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: techBlue,
                        size: 18.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        report.toDate ?? "",
                        style: TextStyle(
                          color: techBlue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Icon(
                        Icons.reply_outlined,
                        color: techBlue,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "3",
                        style: TextStyle(
                          color: techBlue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 25.0),
                      Icon(
                        Icons.history_edu_outlined,
                        color: techBlue,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        report.reportType ?? "",
                        style: TextStyle(
                          color: techBlue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        report.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          report.extract ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.calendar_month_outlined,
                      //         color: techBlue,
                      //         size: 20.0,
                      //       ),
                      //       SizedBox(width: 10.0),
                      //       Text(
                      //         "22 Feb 2022",
                      //         style: TextStyle(
                      //           fontSize: 12.0,
                      //         ),
                      //       ),
                      //       SizedBox(width: 15.0),
                      //       Icon(
                      //         Icons.reply_outlined,
                      //         color: techBlue,
                      //         size: 20.0,
                      //       ),
                      //       SizedBox(width: 5.0),
                      //       Text(
                      //         "3",
                      //         style: TextStyle(
                      //           fontSize: 12.0,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 5.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text(
                              //   "Daily Trading Update",
                              //   style: TextStyle(
                              //     color: techBlue,
                              //     fontSize: 12.0,
                              //     fontWeight: FontWeight.w400,
                              //   ),
                              // ),
                              // SizedBox(width: 20.0),
                              SvgPicture.asset("assets/icons/forward.svg")
                            ],
                          ),
                        ),
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
