// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/theme/padding.dart';
import 'package:jemina_capital/views/home/shared/category_menu.dart';
import 'package:jemina_capital/widgets/custom_holdings_card.dart';
import 'package:jemina_capital/widgets/custom_search_field.dart';
import '../../widgets/go_to_profile.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedIndex = 0;
  bool isLoading = true;

  List<String> categories = [
    "Active",
    "Drafts",
    "Matched",
    "Cancelled",
  ];

  List<IconData> icons = [
    Icons.bolt,
    Icons.edit_note,
    Icons.file_download_done,
    Icons.disabled_by_default,
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
      appBar: buildTradingPageAppBar(context, () {}, 'Orders'),
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: kPrimaryColorLight1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding - 10.0,
                horizontal: 10.0,
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

          // SearchForm(),
          CustomSearchField(
            hintField: "Try Order Number",
            backgroundColor: Colors.white,
          ),

          SizedBox(height: 10.0),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                child: Column(
                  children: [
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                  ],
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
