class TopMarqueePrice{
  final num price;
  final String symbol;
  final num percentageChange;
  final num change;

  TopMarqueePrice(
      this.price,
      this.symbol,
      this.percentageChange,
      this.change
  );

  @override
  String toString(){
    return "TopMarqueePrice. Symbol: $symbol, Price: $price, PercentageChange: $percentageChange, Change: $change";
  }

  static List<TopMarqueePrice> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => TopMarqueePrice.fromJson(i)).toList();
  }

  factory TopMarqueePrice.fromJson(Map<String, dynamic> json) => TopMarqueePrice(
    json["price"],
    json["symbol"],
    json["percentage_change"],
    json["change"],
  );

}