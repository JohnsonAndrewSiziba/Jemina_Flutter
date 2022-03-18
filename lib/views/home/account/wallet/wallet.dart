// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../../../data/data.dart';
import '../../../../widgets/card_section.dart';
import '../../../../widgets/notification_icon.dart';
import '../../../../widgets/wallet_content.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List<TransactionModel> _transactionList = [
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-22,50',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-22,50',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    TransactionModel(
      logo: 'assets/images/finance_app.png',
      name: "Title",
      date: '22.02.2020',
      amount: '-75,45',
    ),
  ];

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding + 20.0),
                child: WalletContent(transactions: _transactionList),
              ),
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

class TransactionModel {
  final String logo;
  final String name;
  final String date;
  final String amount;

  const TransactionModel({
    required this.logo,
    required this.name,
    required this.date,
    required this.amount,
  });
}
