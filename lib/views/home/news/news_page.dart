// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/views/home/news/components/news_page_body.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../widgets/go_to_profile.dart';
import '../../../widgets/header_with_search_bar.dart';

class NewsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  NewsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            HeaderWithSearchBar(placeholder: "Search news...", size: size),
            NewsPageBody(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: techBlue,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          widget.onOpenMenu();
          setState(() {
            widget.state == 0 ? widget.state = 1 : widget.state = 0;
          });
        },
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      title: Text("News"),
      actions: [
        GotoProfile(),
      ],
    );
  }
}
