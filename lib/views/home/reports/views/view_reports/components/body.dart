// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/report.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/components/backdrop_and_title.dart';
import 'package:jemina_capital/views/home/reports/views/view_reports/components/report_title.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Body extends StatefulWidget {
  Report report;
  Body({Key? key, required this.report}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackdropAndTitle(report: widget.report, size: size),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReportTitle(report: widget.report),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    widget.report.section1Title ?? "",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: HtmlWidget(
                    widget.report.section1 ?? "",
                    textStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    widget.report.section2Title ?? "",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: HtmlWidget(
                    widget.report.section2 ?? "",
                    textStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
