// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:jemina_capital/models/report.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/constants/api_routes.dart';

class ReportContent extends StatefulWidget {
  Report report;
  ReportContent({Key? key, required this.report}) : super(key: key);

  @override
  State<ReportContent> createState() => _ReportContentState();
}

class _ReportContentState extends State<ReportContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      body: SafeArea(
        top: false,
        child: getBody(),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(Routes.serverHome + widget.report.path)) throw 'Could not launch ${Routes.serverHome + widget.report.reportImagePath}';
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    Routes.serverHome + widget.report.reportImagePath,
                  ),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: blueColor3,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kPrimaryColorLight2,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Container(
                    //       height: 40.0,
                    //       width: 40.0,
                    //       padding: const EdgeInsets.all(5.0),
                    //       decoration: BoxDecoration(
                    //         color: Colors.transparent,
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 8.0),
                    //         child: NotificationsIcon(),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.35),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0),),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: darkGreyBlue,
                          borderRadius: BorderRadius.circular(10),),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.report.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, height: 1.5,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                      color: darkGreyBlue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            color: lightSteel,
                          ),
                           child: Icon(
                              Icons.download,
                              color: blueColor3,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.report.reportType ?? '',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,
                              color: darkGreyBlue,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month, color: blueColor2, size: 15,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                DateFormat('EEE dd MMM yyyy').format(DateTime.parse(widget.report.toDate!)),
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: brightGrey),
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: blueColor2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'JCB Research',
                                style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: brightGrey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.reply_outlined,
                                color: blueColor2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '0 Comments',
                                style: TextStyle(fontSize: 13, color: Colors.blueGrey,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.report.section1Title ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: darkGreyBlue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HtmlWidget(
                    widget.report.section1 ?? "",
                    textStyle: TextStyle(
                      color: darkGreyBlue,
                      fontSize: 17.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      // letterSpacing: 0.5,
                      // wordSpacing: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.report.section2Title ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: darkGreyBlue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HtmlWidget(
                    widget.report.section2 ?? "",
                    textStyle: TextStyle(
                      color: darkGreyBlue,
                      fontSize: 17.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      // letterSpacing: 0.5,
                      // wordSpacing: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
