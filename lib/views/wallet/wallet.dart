// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/theme/colors.dart';
import 'package:jemina_capital/theme/padding.dart';
import 'package:jemina_capital/views/home/shared/category_menu.dart';
import 'package:jemina_capital/views/portfolio/portfolio.dart';
import 'package:jemina_capital/widgets/custom_holdings_card.dart';
import 'package:jemina_capital/widgets/custom_search_field.dart';
import 'package:jemina_capital/widgets/custom_title.dart';
import '../../widgets/go_to_profile.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int selectedIndex = 0;
  bool isLoading = true;

  List<String> categories = [
    "Deposit & Withdrawal",
    "Buy & Sell Orders",
  ];

  List<IconData> icons = [
    Icons.account_balance,
    Icons.grading,
  ];

  void categortMenuTap(int index) {
    setState(() {
      selectedIndex = index;

      // if (index == 0) {
      //   selectedCountersList = zseCountersList;
      // } else if (index == 1) {
      //   selectedCountersList = zseEtfCountersList;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColorLight1,
        appBar: buildTradingPageAppBar(context, () {}, 'Wallet'),
        body: SafeArea(
          child: getBody(),
        ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: CustomTitle(
              title: 'Wallet Balance',
              color: secondary,
              extend: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 10.0),
            child: Column(
              children: [
                PortfolioSummary(
                  title: "Tradeable Funds",
                  value: "10",
                ),
                Divider(),
                PortfolioSummary(
                  title: "Sell Funds Pending",
                  value: "10,000,000",
                ),
                Divider(),
                PortfolioSummary(
                  title: "Held Funds",
                  value: "1,000",
                ),
                Divider(),
                PortfolioSummary(title: "Total Funds", value: "1,000"),
              ],
            ),
          ),
          SizedBox(height: spacer - 40),

          Row(
            children: [
              EasyElevatedButton(
                label: 'Top Up Wallet',
                isRounded: false,
                color: successGreen,
                onPressed: () {},
              ),
              Spacer(),
              EasyElevatedButton(
                label: 'Withdrawal Req.',
                color: askColor,
                isRounded: false,
                onPressed: () {},
              ),
            ],
          ),

          SizedBox(height: spacer - 40),
          //search
          CustomSearchField(
            hintField: 'Try Transaction ID',
            backgroundColor: Colors.white,
          ),
          SizedBox(height: spacer - 30),

          CustomTitle(title: 'Transaction History', extend: false),
          SizedBox(height: smallSpacer - 20),
          Container(
            color: kPrimaryColorLight1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding - 10.0,
                // horizontal: 10.0,
              ),
              child: SizedBox(
                height: 34,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategoryItem(
                      index, categortMenuTap, selectedIndex, icons, categories),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: CustomHoldingsCard(
                  image:
                      "https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80",
                  title: "Afdis",
                  instructor: "one",
                  videoAmount: "Two",
                  percentage: 33,
                ),
              ),
            ),
          ),
        ],
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
      actions: [
        GotoProfile(),
      ],
    );
  }
}
