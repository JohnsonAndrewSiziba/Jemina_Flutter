// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import '../../widgets/go_to_profile.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: buildTradingPageAppBar(context, () {}, 'Orders'),
      body: Center(
        child: Text('Coming Soon', style: TextStyle(color: darkGreyBlue),),
      ),
    );
  }

  AppBar buildTradingPageAppBar(BuildContext context, Function onTap, String pageTitle) {
    return AppBar(
      centerTitle: true,
      backgroundColor: jeminaGrey,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      title: Text(pageTitle, style: TextStyle(color: darkGreyBlue),),
      actions: const [
        GotoProfile(),
      ],
    );
  }

}
