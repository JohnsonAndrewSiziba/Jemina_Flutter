import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:jemina_capital/views/home/news/components/list_widget.dart';
import 'package:jemina_capital/views/home/news/components/news_item.dart';
import 'package:jemina_capital/views/home/news/view_news/view_news.dart';

class NewsPageBody extends StatelessWidget {
  List<News> newsList;
  NewsPageBody({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: techBlue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewNews(article: newsList[index]),
                ),
              );
            },
            // child: listWidget(newsTiles[index]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: newsListWidget(news: newsList[index], context: context),
            ),
          );
        },
      ),
    );
  }
}
