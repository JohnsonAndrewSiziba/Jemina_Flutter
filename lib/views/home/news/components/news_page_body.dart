import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/news/components/list_widget.dart';
import 'package:jemina_capital/views/home/news/components/news_item.dart';
import 'package:jemina_capital/views/home/news/view_news/view_news.dart';

class NewsPageBody extends StatelessWidget {
  NewsPageBody({Key? key}) : super(key: key);

  List<NewsItem> newsTiles = [
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title This is the title This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
    NewsItem(
      "https://www.newsday.co.zw/wp-content/uploads/2015/06/town-house22.jpg",
      "This is the title",
      "NewsDay",
      "23 Mar 2022",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: newsTiles.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: techBlue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewNews(),
                ),
              );
            },
            child: listWidget(newsTiles[index]),
          );
        },
      ),
    );
  }
}
