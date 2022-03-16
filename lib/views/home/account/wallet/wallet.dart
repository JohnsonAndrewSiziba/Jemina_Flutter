// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../../../data/data.dart';
import '../../../../widgets/card_section.dart';
import '../../../../widgets/wallet_content.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CardSection(),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: WalletContent(),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("My Wallet"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: NotificationsIcon(),
        ),
      ],
    );
  }
}

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        boxShadow: customShadow,
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                color: complement,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                boxShadow: customShadow,
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.notifications,
              color: techBlue,
            ),
          ),
        ],
      ),
    );
  }
}
