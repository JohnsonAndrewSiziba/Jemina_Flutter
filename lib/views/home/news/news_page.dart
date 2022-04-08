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
      appBar: buildAppBar(context),
      body: Skeleton(
        skeleton: SkeletonListView(),
        isLoading: isLoading,
        child: Container(
          color: lightSteel,
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: jeminaGrey,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          widget.onOpenMenu();
          setState(() {
            widget.state == 0 ? widget.state = 1 : widget.state = 0;
          });
        },
        icon: SvgPicture.asset("assets/icons/menu.svg", color: darkGreyBlue),
      ),
      title: Text("News", style: TextStyle(color: darkGreyBlue),),
      actions: [
        GotoProfile(),
      ],
    );
  }
}
