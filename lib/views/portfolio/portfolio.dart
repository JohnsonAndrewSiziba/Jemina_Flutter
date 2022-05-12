// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import '../../widgets/go_to_profile.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: buildTradingPageAppBar(context, () {}, 'Portfolio'),
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
      actions: [
        GotoProfile(),
      ],
    );
  }

}
