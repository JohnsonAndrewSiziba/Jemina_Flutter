// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';

class WalletContent extends StatelessWidget {
  const WalletContent({Key? key}) : super(key: key);

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
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: transactions
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: complement,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  e['transaction'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(239, 34, 33, 33),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
