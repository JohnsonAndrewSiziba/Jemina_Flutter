import 'package:intl/intl.dart';

class News {
  final int id;
  final String title;
  final String date;
  final String publication;
  final String imagePath;
  final String url;

  News(this.id, this.title, this.date, this.publication, this.imagePath,
      this.url);

  static List<News> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => News.fromJson(i)).toList();
  }

  factory News.fromJson(Map<String, dynamic> json) => News(
        json["id"],
        json["title"],
        DateFormat('yyyy-MM-dd').format(DateTime.parse(json["date"])),
        json["publication"],
        json["image_path"],
        json["url"],
      );
}
