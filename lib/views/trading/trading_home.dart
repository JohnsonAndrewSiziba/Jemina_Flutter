// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/shared/build_main_page_app_bar.dart';

import '../../widgets/go_to_profile.dart';

class TradingHome extends StatefulWidget {
  const TradingHome({Key? key}) : super(key: key);

  @override
  State<TradingHome> createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: buildTradingPageAppBar(context, () {}, 'Trading'),
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
