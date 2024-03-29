// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/controllers/news/news_controller.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:jemina_capital/views/home/news/components/news_page_body.dart';
import 'package:skeletons/skeletons.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../library/request_response.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';

class NewsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  NewsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late RequestResponse requestResponse;
  List<News> newsList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  void onOpenMenu() {
    widget.onOpenMenu();
  }

  void getNews() async {
    NewsController newsController = NewsController();
    requestResponse = await newsController.getNews();
    var jsonBody = requestResponse.getJsonBody();

    var jsonNewsList = jsonBody['news'];

    setState(() {
      newsList = News.jsonDecode(jsonNewsList);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: brightGrey,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Business News"),
      body: Skeleton(
        skeleton: SkeletonListView(),
        isLoading: isLoading,
        child: Container(
          color: kPrimaryColorLight1,
          child: Column(
            children: [
              // HeaderWithSearchBar(placeholder: "Search news...", size: size),
              NewsPageBody(newsList: newsList),
            ],
          ),
        ),
      ),
    );
  }
}
