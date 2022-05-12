import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:jemina_capital/views/home/news/components/list_widget.dart';
import 'package:jemina_capital/views/home/news/components/news_item.dart';

class NewsPageBody extends StatelessWidget {
  List<News> newsList;
  NewsPageBody({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: darkGreyBlue,
        backgroundColor: brightGrey,
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1));
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0, bottom: 70.0),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: newsListWidget(news: newsList[index], context: context),
            );
          },
        ),
      ),
    );
  }

}
