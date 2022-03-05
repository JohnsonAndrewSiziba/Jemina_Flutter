// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';

import '../widgets/card_section.dart';
import '../widgets/wallet_content.dart';
import '../widgets/wallet_header.dart';

class AmazingUI extends StatefulWidget {
  const AmazingUI({Key? key}) : super(key: key);

  @override
  State<AmazingUI> createState() => _AmazingUIState();
}

class _AmazingUIState extends State<AmazingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 120,
            child: WalletHeader(),
          ),
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
}
