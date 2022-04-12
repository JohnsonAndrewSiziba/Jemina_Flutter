// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/company.dart';
import 'package:jemina_capital/views/home/counters/views/view_counter/components/body.dart';

import '../../../../../data/constants/api_routes.dart';
import '../../../../../widgets/notification_icon.dart';

class ViewCounter extends StatefulWidget {
  Company company;
  ViewCounter({Key? key, required this.company}) : super(key: key);

  @override
  State<ViewCounter> createState() => _ViewCounterState();
}

class _ViewCounterState extends State<ViewCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Material(
                    elevation: 0.1,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      // width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              Routes.serverHome + (widget.company.logoPath ?? ""),
                              height: 60,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.company.name ?? "",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreyBlue,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "(${widget.company.symbol?.toUpperCase()})" ?? "",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreyBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: jeminaGrey,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      title: Text(
        widget.company.name ?? 'Counter',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: darkGreyBlue),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: NotificationsIcon(),
        ),
      ],
    );
  }
}
