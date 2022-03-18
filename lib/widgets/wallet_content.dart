// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';
import 'package:jemina_capital/views/home/account/wallet/wallet.dart';

class WalletContent extends StatelessWidget {
  List<TransactionModel> transactions;

  WalletContent({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            "Transactions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: techBlue,
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(),
            itemCount: transactions.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor.withOpacity(0.1)),
                ),
                child: Image.asset(
                  transactions[index].logo,
                  fit: BoxFit.cover,
                  width: 30,
                  height: 30,
                ),
              ),
              title: Text(
                transactions[index].name,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                transactions[index].date,
                style: TextStyle(
                  color: primaryColor.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                transactions[index].amount,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
