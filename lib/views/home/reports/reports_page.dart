// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jemina_capital/controllers/reports/reports_controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/constants/values.dart';
import 'package:jemina_capital/library/request_response.dart';
import 'package:jemina_capital/models/report.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/report_content.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/view_report.dart';
import 'package:skeletons/skeletons.dart';

import '../../../widgets/card.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';
import '../shared/category_menu.dart';

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

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllReports();
  }

  void getAllReports() async {
    ReportsController reportsController = ReportsController();
    requestResponse = await reportsController.getDailyTradingUpdates();
    var jsonBody = requestResponse.getJsonBody();

    var jsonReportsList = jsonBody['reports'];



    setState(() {
      reportsList = Report.jsonDecode(jsonReportsList);
      isLoading = false;
    });
  }

  void categortMenuTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  void onOpenMenu() {
    widget.onOpenMenu();
  }

  List<String> categories = [
    "Daily",
    "Weekly",
    "Monthly",
    "Reports"
  ];

  List<IconData> icons = [
    Icons.calendar_today,
    Icons.calendar_view_week,
    Icons.calendar_month_outlined,
    Icons.trending_up,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainPageAppBar(context, onOpenMenu, "Trading Updates"),
      backgroundColor: kPrimaryColorLight1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              // color: jeminaGrey,
              color: kPrimaryColorLight1,
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
            child: Skeleton(
              isLoading: isLoading,
              skeleton: SkeletonListView(),
              child: Container(
                color: kPrimaryColorLight1,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: reportsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: reportListWidget(context: context, report: reportsList[index]),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget reportListWidget({required BuildContext context, required Report report}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReportContent(report: report),
          // builder: (context) => ViewReport(report: report),
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
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: darkGreyBlue,),
                      ),
                      Text(
                        report.extract ?? "",
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: darkGreyBlue,
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
                Text("Date: " + DateFormat('EEE dd MMM yyyy').format(DateTime.parse(report.toDate!)), style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                Spacer(),
                Text(report.reportType ?? "", style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}