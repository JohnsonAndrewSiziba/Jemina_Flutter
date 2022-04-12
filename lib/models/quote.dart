class Quote {
  final String? text;
  final String? author;

  Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    text: json["text"], author: json["thor"],
  );

  @override
  String toString(){
    return "Quote: $text - $author";
  }

  static List<Quote> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => Quote.fromJson(i)).toList();
  }

}