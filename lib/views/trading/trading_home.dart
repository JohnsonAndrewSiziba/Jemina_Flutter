// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/widgets/card.dart';
import '../../widgets/go_to_profile.dart';
import 'components/search_form.dart';

class TradingHome extends StatefulWidget {
  const TradingHome({Key? key}) : super(key: key);

  @override
  State<TradingHome> createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      appBar: buildTradingPageAppBar(context, () {}, 'Markets'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchForm(),

            ],
          ),
        ),
      ),
    );
  }

  AppBar buildTradingPageAppBar(
      BuildContext context, Function onTap, String pageTitle) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColorLight1,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGreyBlue),
      title: Text(
        pageTitle,
        style: TextStyle(color: darkGreyBlue),
      ),
      actions: const [
        GotoProfile(),
      ],
    );
  }
}

class WalletBalance extends StatelessWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



        ],
      ),
    );
  }
}
