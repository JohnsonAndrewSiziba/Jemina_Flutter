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
      backgroundColor: lightSteel,
      appBar: buildTradingPageAppBar(context, () {}, 'Trading'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchForm(),
              SizedBox(height: 18.0),
              WalletBalance(),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: jeminaGrey,
                ),
              ),
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
      backgroundColor: jeminaGrey,
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
          Row(
            children: [
              Icon(Icons.credit_card, color: Colors.blueGrey, size: 20.0),
              SizedBox(width: 5.0),
              Text(
                "Wallet Balance",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$200,600.00",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSansIndicSiyaqNumbers(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    color: darkGreyBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: jeminaGrey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "+ Top Up",
                      style: TextStyle(
                        color: darkGreyBlue,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text("Hello, World!"),

        ],
      ),
    );
  }
}
